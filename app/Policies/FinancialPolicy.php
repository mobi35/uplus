<?php

namespace App\Policies;

use App\Models\Financial;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use Chiiya\FilamentAccessControl\Models\FilamentUser;

class FinancialPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
   
	public function viewAny(FilamentUser $user): bool
	{
		return $user->can('financial.view');
	} 

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Building  $building
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(FilamentUser $user, Financial $building)
    {
		return $user->can('financial.viewpage');
        //
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(FilamentUser $user)
    {
		return $user->can('financial.create');
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Building  $building
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(FilamentUser $user, Financial $building)
    {
		return $user->can('financial.update');
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Building  $building
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(FilamentUser $user, Financial $building)
    {
        //

		return $user->can('financial.delete');
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Building  $building
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(FilamentUser $user, Financial $building)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Building  $building
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(FilamentUser $user, Financial $building)
    {
        //
    }
}
