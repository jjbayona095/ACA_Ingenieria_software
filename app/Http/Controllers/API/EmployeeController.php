<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Current;
use App\Models\Employee;
use Illuminate\Support\Facades\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;



class EmployeeController extends Controller
{
    public function employeeAllRegistered()
    {
        $data = Employee::leftJoin('collection_account', function ($join) {
            $join->on('employees.id', '=', 'collection_account.employee_id')
                ->whereRaw('collection_account.created_at = (select max(created_at) from collection_account where employee_id = employees.id)');
        })
            ->where('employees.state', 0) // Agregar esta línea para filtrar por estado 0
            ->select('employees.*', 'collection_account.created_at as created_collection_account')
            ->get();

        return response()->json($data);
    }

    public function deleteEmployeed($id)
    {
        $employee = Employee::find($id);
        if (!$employee) {
            return response()->json(['error' => 'Employee no found'], 404);
        }
        $employee->state = 1;
        $employee->save();
        return response()->json(['message' => 'Registro eliminado con exito'], 200);
    }

    public function bonusEmployeed($id, $bonus){
        $employee = Employee::find($id);
        if (!$employee) {
            return response()->json(['error' => 'Employee no found'], 404);
        }
        $employee->bonus = $bonus;
        $numericValue = str_replace(['$', '.'], '',  $employee->value);
        $numericBonus = str_replace(['$', '.'], '', $employee->bonus);
        $numericDiscount = str_replace(['$', '.'], '', $employee->discount);
        $total = $numericValue + $numericBonus + $numericDiscount;
        $formattedTotal = number_format($total, 0, '.', '.');
        $employee->total = "$". $formattedTotal;
        $employee->save();
    }

    public function signatureEmployeed($filename)
    {
        $path = storage_path('app/signatures/' . $filename);

        if (!File::exists($path)) {
            return response()->json(['error' => 'no existe imagen'], 404);
        }

        $file = File::get($path);
        $type = File::mimeType($path);

        $response = response($file, 200);;
        $response->header("Content-Type", $type);

        return $response;
    }

    public function collectionAccount($year, $month)
    {
        $data = Current::whereYear('created_at', '=', $year)
            ->whereMonth('created_at', '=', $month)
            ->where('send_to_email', '!=', null)
            ->where('send_to_email', '!=', '0000-00-00')
            ->where('send_to_email', '>=', '1900-01-01')
            ->get();


        $count = $data->count();
        $result = $data->map(function ($item) use ($count) {
            $employee = Employee::find($item->employee_id);
            return [
                "current_employee_id" => $item->employee_id,
                "employee_name" => $employee->name,
                "employee_cc" => $employee->identification_number,
                "employee_email" => $employee->email,
                "employee_url_file" => $item->url_file,
                "created_at" => $item->created_at,
                "updated_at" => $item->updated_at,
                "send_to_email" => $count
            ];
        });

        return response()->json($result);
    }

    public function viewPdf(Request $request)
    {
        $path = $request->input('path');
        $file = Storage::get($path);
        $type = Storage::mimeType($path);

        $response = response($file, 200)->header('Content-Type', $type);
        return $response;
    }
}
