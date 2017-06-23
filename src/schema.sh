#!/bin/sh
function execute { echo "-- $1"; echo; cat "$1"; echo; }

# Schema
echo "DROP SCHEMA IF EXISTS conreality CASCADE;"; echo
echo "CREATE SCHEMA conreality;"; echo

# Extensions
execute _extensions.sql

# Table references
execute binary.table.sql
execute theater.table.sql
execute group.table.sql
execute object.table.sql

# Tables
execute asset.table.sql
execute camera.table.sql
execute camera_frame.table.sql
execute event.table.sql
execute message.table.sql
execute player.table.sql
execute target.table.sql

# Views
execute message_with_avatar.view.sql
execute object_asset.view.sql
execute object_camera.view.sql
execute object_player.view.sql
execute object_target.view.sql

# Functions
execute event_send.function.sql
execute message_send.function.sql
execute object_invert_mass.function.sql
execute object_is_accelerating.function.sql
execute object_is_active.function.sql
execute object_is_immovable.function.sql
execute object_is_inactive.function.sql
execute object_is_located.function.sql
execute object_is_moving.function.sql
execute object_is_rotating.function.sql
execute player_deregister.function.sql
execute player_register.function.sql
execute point_2d.function.sql
execute point_3d.function.sql
execute point_gps.function.sql
execute session_start.function.sql
execute session_terminate.function.sql
