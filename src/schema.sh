#!/bin/sh
basedir=`dirname $0`
function load { echo "-- $1"; echo; cat "$basedir/$1" || exit 1; echo; }

# Schema
echo "DROP SCHEMA IF EXISTS conreality CASCADE;"; echo
echo "CREATE SCHEMA conreality;"; echo

# Extensions
load _extensions.sql

# Data Types
load binary_type.type.sql
load measure_type.type.sql
load object_type.type.sql

# Table references
load binary.table.sql
load theater.table.sql
load group.table.sql
load object.table.sql

# Tables
load asset.table.sql
load camera.table.sql
load camera_frame.table.sql
load event.table.sql
load message.table.sql
load object_motion.table.sql
load player.table.sql
load player_heartbeat.table.sql
load target.table.sql

# Views
load asset_object.view.sql
load camera_object.view.sql
load message_with_avatar.view.sql
load player_object.view.sql
load target_object.view.sql

# Functions
load distance_between.function.sql
load event_send.function.sql
load message_send.function.sql
load motion_report.function.sql
load object_invert_mass.function.sql
load object_is_accelerating.function.sql
load object_is_active.function.sql
load object_is_immovable.function.sql
load object_is_inactive.function.sql
load object_is_located.function.sql
load object_is_moving.function.sql
load object_is_rotating.function.sql
load object_location.function.sql
load object_velocity.function.sql
load player_deregister.function.sql
load player_register.function.sql
load point_2d.function.sql
load point_3d.function.sql
load point_gps.function.sql
load session_start.function.sql
load session_terminate.function.sql
