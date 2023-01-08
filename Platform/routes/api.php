<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ExpertController;
use App\Http\Controllers\ConsultingController;
use App\Http\Controllers\TimeController;
use App\Http\Controllers\ExperienceController;
use App\Http\Controllers\WalletController;
use App\Http\Controllers\RateController;
use App\Http\Controllers\ReservationtController;
use App\Http\Controllers\FavouriteController;
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
Route::group(['middleware' => 'api','prefix' => 'auth'], function ($router) {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);
    Route::post('/addExperience', [ExperienceController::class, 'strExperience']);
    Route::post('/addtime', [TimeController::class, 'strtime']);
    Route::post('/updatetime', [TimeController::class, 'updatetime']);
    Route::post('/addCredit', [WalletController::class, 'addCredit']);
    Route::post('/reserveTime/{id}', [ReservationtController::class, 'reserveTime']);
    Route::post('/addtofav', [FavouriteController ::class, 'addtofavourite']);
    Route::get('/showfav', [FavouriteController ::class, 'showfav']);
});

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::post('/addExpert', [ExpertController::class, 'strExpert']);
Route::get('/viewexperts/{id}', [ExpertController::class, 'viewexperts']);
Route::get('/viewexpert/{id}', [ExpertController::class, 'viewexpert']);
Route::get('/veiwReservation/{id}', [ExpertController::class, 'veiwReservation']);
Route::get('/searchexpertName/{name}', [ExpertController::class, 'viewexpertName']);
Route::get('/viewavg/{id}', [ExpertController::class, 'viewavg']);
Route::get('allexpert', [ExpertController::class, 'allexpert']);

Route::get('/viewConsultings', [ConsultingController::class, 'viewConsultings']);
Route::get('/searchConsultingName/{name}', [ConsultingController::class, 'viewConsultingName']);

Route::get('/viewTime/{id}', [TimeController::class, 'viewTime']);



Route::delete('/deleteReserv/{id}', [ReservationtController::class, 'deleteReserv']);

Route::post('/addrate/{id}', [RateController::class, 'addrate']);



