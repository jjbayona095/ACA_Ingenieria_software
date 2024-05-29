<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\EmployeeController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', [UserController::class, 'login']);
Route::post('logout', [UserController::class, 'logout']);

Route::get('signatures/{filename}', [EmployeeController::class, 'signatureEmployeed']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('employeeAllRegistered', [EmployeeController::class, 'employeeAllRegistered']);
    Route::get('historyAllRegistered', [UserController::class, 'historyAllRegistered']);
    Route::get('getConcept', [UserController::class, 'getConcept'])->middleware('can:isAdmin');
    Route::get('getJob', [UserController::class, 'getJob'])->middleware('can:isAdmin');

    //Change Password
    Route::post('changePassword', [UserController::class, 'changePassword'])->middleware('can:isAdmin');

    //delete
    Route::post('deleteConcept', [UserController::class, 'deleteManagement'])->middleware('can:isAdmin');

    Route::post('addHistory', [UserController::class, 'addHistory'])->middleware('can:isAdmin');
    Route::post('registerEmployee', [UserController::class, 'registerEmployee'])->middleware('can:isAdmin');
    Route::post('addConcept', [UserController::class, 'addConcept'])->middleware('can:isAdmin');
    Route::post('editConcept', [UserController::class, 'editConcept'])->middleware('can:isAdmin');
    Route::post('addJobPosition', [UserController::class, 'addJobPosition'])->middleware('can:isAdmin');
    Route::post('updateEmployee/{id}', [UserController::class, 'updateEmployee'])->middleware('can:isAdmin');
    Route::post('editBonusEmployeed/{id}', [UserController::class, 'editBonusEmployeed'])->middleware('can:isAdmin');
    Route::delete('deleteEmployeed/{id}', [EmployeeController::class, 'deleteEmployeed'])->middleware('can:isAdmin');
    Route::post('bonusEmployeed/{id}/{bonus}',[EmployeeController::class, 'bonusEmployeed'])->middleware('can:isAdmin');
 
    //Collection account
    Route::post('uploadCollectionAccount/{year}/{month}', [UserController::class, 'uploadCollectionAccount'])->middleware('can:isAdmin');
    Route::get('collectionAccount/{year}/{month}',[EmployeeController::class, 'collectionAccount'])->middleware('can:isAdmin');
    Route::get('/pdf/view', [EmployeeController::class, 'viewPdf'])->name('pdf.view')->middleware('can:isAdmin');
});
