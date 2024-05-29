<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('employment');
            $table->string('identification_number');
            $table->string('address');
            $table->string('city');
            $table->string('postal_code');
            $table->string('phone_number');
            $table->string('email');
            $table->string('concept');
            $table->string('value');
            $table->string('bonus');
            $table->string('discount');
            $table->string('total');
            $table->string('bank');
            $table->string('type_account_bank');
            $table->string('number_account');
            $table->integer('consecutive');
            $table->string('upload_signature');
            $table->string('state');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('employees');
    }
}
