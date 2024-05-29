<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\Models\Concept;
use App\Models\Current;
use App\Models\History;
use App\Models\JobPosition;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use PhpParser\Node\Stmt\TryCatch;


class UserController extends Controller
{
    public function login(Request $request)
    {
        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
        ];

        if (Auth::attempt($credentials)) {
            /** @var App\Models\User $user **/
            $user = Auth::user();
            $token = $user->createToken('authToken')->plainTextToken;
            $user->api_token = $token;
            $user->save();
            $message = 'User login successfully';
            $success = true;

            $response = [
                'success' => $success,
                'token' => $token,
                'user' => $user,
                'message' => $message,
            ];

            return response()->json($response);
        } else {
            $success = false;
            $message = 'Unauthorised';
        }

        // response
        $response = [
            'success' => $success,
            'message' => $message,
        ];
        return response()->json($response);
    }

    /**
     * Logout
     */
    public function logout(Request $request)
    {
        $request->validate([
            'user_id' => ['required']
        ]);

        try {
            $user = User::find($request->user_id);
            $user->tokens()->delete();
            $success = true;
            $message = 'Successfully logged out';
        } catch (\Illuminate\Database\QueryException $ex) {
            $success = false;
            $message = $ex->getMessage();
        }

        $response = [
            'success' => $success,
            'message' => $message,
            'api' => $user
        ];
        return response()->json($response);
    }

    public function addHistory(Request $request)
    {
        $history = new History;
        $history->username = $request->username;
        $history->action = $request->action;
        $history->description_action = $request->description;
        $history->save();
    }

    public function historyAllRegistered()
    {
        $data = History::orderBy('created_at')->get();
        return response()->json($data);
    }

    public function registerEmployee(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'employment' => 'required|string|max:255',
            'identification_number' => 'required|string|max:255',
            'address' => 'required|string|max:255',
            'city' => 'required|string|max:255',
            'postal_code' => 'required|string|max:255',
            'phone_number' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'concept' => 'required|string|max:255',
            'value' => 'required|string|max:255',
            'bonus' => 'required|string|max:255',
            'discount' => ' required|string|max:255',
            'total' => 'required|string|max:255',
            'bank' => 'required|string|max:255',
            'type_account_bank' => 'required|string|max:255',
            'number_account' => 'required|string|max:255',
            'consecutive' => 'required|integer',
            'upload_signature' => 'required|image|mimes:jpeg,png|max:2048'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 422);
        }

        $employee = new Employee;
        $employee->name = $request->name;
        $employee->employment = $request->employment;
        $employee->identification_number = $request->identification_number;
        $employee->address = $request->address;
        $employee->city = $request->city;
        $employee->postal_code = $request->postal_code;
        $employee->phone_number = $request->phone_number;
        $employee->employment = $request->employment;
        $employee->email = $request->email;
        $employee->concept = $request->concept;
        $employee->value = $request->value;
        $employee->bonus = $request->bonus;
        $employee->discount = $request->discount;
        $employee->total = $request->total;
        $employee->bank = $request->bank;
        $employee->type_account_bank = $request->type_account_bank;
        $employee->consecutive = $request->consecutive;
        $employee->number_account = $request->number_account;

        $history = new History();
        $history->username = $request->username;
        $history->action = $request->action;
        $history->description_action = $request->description_action;
        $history->save();

        // Guardar imagen
        if ($request->hasFile('upload_signature')) {
            $upload_signature = $request->file('upload_signature');
            $path = $upload_signature->store('signatures'); // guardar imagen en la carpeta "signatures"
            $employee->upload_signature = $path;
        }
        $employee->save();

        try {
            //code...
            $emailsend = $request->email;
            $name = $request->name;
            $mailData = [
                'title' => '',
                'body' => ''
            ];
            $htmlContent = view('emailRegistered', compact('emailsend', 'name'))->render();

            Mail::send([], $mailData, function ($message) use ($emailsend, $htmlContent) {
                $message->to($emailsend);
                $message->subject('Se ha registrado exitosamente a tu cuenta de cobro');
                $message->setBody($htmlContent, 'text/html');
            });
        } catch (\Exception $th) {
            print_r($th->getMessage());
            die;
        }


        return response()->json([
            'message' => 'Employee created successfully!'
        ], 201);
    }

    public function changePassword(Request $request)
    {
        $user = User::find(Auth::user()->id);

        if (Hash::check($request->current_password, $user->password)) {
            $newPasswordHash = Hash::make($request->new_password);
            $user->password = $newPasswordHash;
            $user->save();
            return response()->json(['message' => 'Password changed successfully'], 200);
        } else {
            return response()->json(['error' => 'La contraseña actual es incorrecta'], 401);
        }
    }

    public function addConcept(Request $request)
    {
        $concept = new Concept();
        $concept->description = $request->description;
        $concept->state = 1;
        $concept->save();
    }


    public function editConcept(Request $request)
    {
        $concept = Concept::find($request->id);
        $concept->description = $request->description;
        $concept->save();
        return response()->json(['message' => 'Concepto actualizado exitosamente']);
    }


    public function getConcept()
    {
        $concept = Concept::all();
        return $concept;
    }



    public function addJobPosition(Request $request)
    {
        $concept = new JobPosition();
        $concept->description = $request->description;
        $concept->state = 1;
        $concept->save();
    }

    public function getJob()
    {
        $jobs = JobPosition::all();
        return $jobs;
    }

    public function deleteManagement(Request $request)
    {
        if ($request->who == "concept") {
            $concept = Concept::findOrFail($request->id);
            $concept->delete();
        } else {
            $jobsPosition = JobPosition::findOrFail($request->id);
            $jobsPosition->delete();
        }
    }

    public function updateEmployee(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|string|max:255',
            'employment' => 'sometimes|string|max:255',
            'identification_number' => 'sometimes|string|max:255',
            'address' => 'sometimes|string|max:255',
            'city' => 'sometimes|string|max:255',
            'postal_code' => 'sometimes|string|max:255',
            'phone_number' => 'sometimes|string|max:255',
            'email' => 'sometimes|string|email|max:255|unique:users,email,' . $id,
            'concept' => 'sometimes|string|max:255',
            'value' => 'sometimes|string|max:255',
            'bonus' => 'sometimes|string|max:255',
            'discount' => 'sometimes|string|max:255',
            'total' => 'sometimes|string|max:255',
            'bank' => 'sometimes|string|max:255',
            'type_account_bank' => 'sometimes|string|max:255',
            'number_account' => 'sometimes|string|max:255',
            'consecutive' => 'sometimes|integer',
            'upload_signature' => 'nullable|image|mimes:jpeg,png|max:2048'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 422);
        }

        $employee = Employee::findOrFail($id);
        $employee->fill($request->only([
            'name',
            'employment',
            'identification_number',
            'address',
            'city',
            'postal_code',
            'phone_number',
            'email',
            'concept',
            'value',
            'bonus',
            'discount',
            'total',
            'bank',
            'type_account_bank',
            'consecutive',
            'number_account'
        ]));

        // Guardar imagen si se proporciona
        if ($request->hasFile('upload_signature')) {
            $upload_signature = $request->file('upload_signature');
            $path = $upload_signature->store('signatures');
            $employee->upload_signature = $path;
        }

        $history = new History();
        $history->username = $request->username;
        $history->action = $request->action;
        $history->description_action = $request->description_action;
        $history->save();

        $employee->save();

        return response()->json([
            'message' => 'Employee updated successfully!'
        ], 200);
    }

    public function uploadCollectionAccount(Request $request, $year, $month)
    {

        $validator = Validator::make($request->all(), [
            'employee_id' => 'required|string|max:255',
            'execution_period' => 'required|string|max:255',
            'end_of_execution_period' => 'required|string|max:255',
            'number_collection_account' => 'required|string|max:255',
            'name_pdf' => 'file|mimes:pdf',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors()
            ], 422);
        }


        $collection = new Current;
        $collection->employee_id = $request->employee_id;
        $collection->execution_period = $request->execution_period;
        $collection->end_of_execution_period = $request->end_of_execution_period;

        $employee = Employee::findOrFail($request->employee_id);

        if ($request->hasFile('name_pdf')) {
            $pdfFile = $request->file('name_pdf');
            $pdfFileName = $pdfFile->getClientOriginalName();

            $folderPath = 'collection_account/' . $year . '/' . $month;
            $filePath = $folderPath . '/' . $pdfFileName;
            // Crear la carpeta si no existe
            if (!file_exists($folderPath)) {
                mkdir($folderPath, 0777, true);
            }

            if (Storage::exists($filePath)) {
                $employee->consecutive = $request->number_collection_account - 1;
                $collection->number_collection_account = $request->number_collection_account - 1;
            } else {
                $collection->number_collection_account = $request->number_collection_account;
                $employee->consecutive = $request->number_collection_account;
            }

            $employee->save();
            // Guardar el archivo dentro de la carpeta
            $pdfFilePath = $pdfFile->storeAs($folderPath, $pdfFileName);

            $collection->url_file = $pdfFilePath;
        }


        $collection = Current::updateOrCreate(
            [
                'url_file' => $pdfFilePath
            ],
            [
                'employee_id' => $request->employee_id,
                'execution_period' => $request->execution_period,
                'end_of_execution_period' => $request->end_of_execution_period,
                'number_collection_account' => $request->number_collection_account,
                'url_file' => $pdfFilePath,
                'send_to_email' => date('Y-m-d')
            ]
        );


        $employeeEmail = $employee->email;
        $mailData = [
            'title' => 'Cuenta de cobro',
            'body' => 'Cuenta de cobro generada'
        ];
        $storagePath = storage_path('app/');
        $fullPath = $storagePath . $pdfFilePath;
        $htmlContent = view('email')->render();

        try {
            Mail::send([], $mailData, function ($message) use ($employeeEmail, $fullPath, $htmlContent) {
                $message->to($employeeEmail);
                $message->subject('Cuenta de cobro generada Intuition Business');
                $message->setBody($htmlContent, 'text/html');
                $message->attach($fullPath);
            });
            $collection->send_to_email = date('Y-m-d');
        } catch (\Exception $e) {
            return response()->json(["msj" => $e->getMessage()]);
        }

        $collection->save();
    }
}
