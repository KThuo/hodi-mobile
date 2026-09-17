import 'package:flutter/material.dart';

/// The amenity glyphs, as Material icons.
///
/// A port of `hodi-f/src/components/icons/amenityIcons.ts`, key for key. The keys are set on the
/// server when an estate defines an amenity, so both clients receive the same strings and must
/// agree about what they mean — a borehole that is a droplet on a laptop and a tick on a handset
/// is two products.
///
/// The glyphs differ, because the sets do: the web draws Lucide and this draws Material, and there
/// is no Lucide in Flutter worth adding a font for. What is preserved is the *mapping* — which
/// amenity gets a distinguishable glyph, and which ones share one.
///
/// An unknown key falls back rather than failing. A key can reach the database before this file
/// knows about it — another deployment, a newer web build — and an amenity whose glyph is missing
/// should still show its name.
abstract class AmenityIcons {
  static const IconData fallback = Icons.auto_awesome_outlined;

  static const Map<String, IconData> _byKey = {
    // Water
    'water': Icons.water_drop_outlined,
    'heater': Icons.local_fire_department_outlined,
    'shower': Icons.shower_outlined,
    'bath': Icons.bathtub_outlined,
    'tank': Icons.propane_tank_outlined,

    // Power
    'generator': Icons.bolt_outlined,
    'solar': Icons.wb_sunny_outlined,
    'fuel': Icons.local_gas_station_outlined,
    'lighting': Icons.lightbulb_outline,

    // Security
    'cctv': Icons.videocam_outlined,
    'camera': Icons.photo_camera_outlined,
    'guard': Icons.shield_outlined,
    'wall': Icons.fence_outlined,
    'gate': Icons.door_front_door_outlined,
    'lock': Icons.lock_outline,
    'access': Icons.key_outlined,
    'alarm': Icons.notifications_outlined,

    // Shared facilities
    'lift': Icons.elevator_outlined,
    'pool': Icons.pool_outlined,
    'gym': Icons.fitness_center_outlined,
    'playground': Icons.child_friendly_outlined,
    'parking': Icons.local_parking_outlined,
    'carport': Icons.directions_car_outlined,
    'bikes': Icons.directions_bike_outlined,
    'clubhouse': Icons.apartment_outlined,
    'games': Icons.sports_esports_outlined,
    'accessible': Icons.accessible_outlined,
    'staff': Icons.groups_outlined,

    // Inside the unit
    'kitchen': Icons.countertops_outlined,
    'fridge': Icons.kitchen_outlined,
    'microwave': Icons.microwave_outlined,
    'laundry': Icons.local_laundry_service_outlined,
    'furnished': Icons.weekend_outlined,
    'seating': Icons.chair_outlined,
    'aircon': Icons.hvac_outlined,
    'fan': Icons.air_outlined,
    'cooling': Icons.ac_unit_outlined,
    'tv': Icons.tv_outlined,
    'wifi': Icons.wifi_outlined,
    'router': Icons.router_outlined,
    'dstv': Icons.settings_input_antenna_outlined,
    'audio': Icons.speaker_outlined,
    'desk': Icons.desk_outlined,
    'blinds': Icons.blinds_outlined,
    'dsq': Icons.meeting_room_outlined,
    'store': Icons.inventory_2_outlined,

    // Outside the unit
    'balcony': Icons.balcony_outlined,
    'garden': Icons.local_florist_outlined,
    'trees': Icons.park_outlined,
    'grounds': Icons.forest_outlined,
    'terrace': Icons.deck_outlined,

    // Other
    'pets': Icons.pets_outlined,
    'waste': Icons.delete_outline,
    'recycling': Icons.recycling_outlined,
    'green': Icons.eco_outlined,
    'maintenance': Icons.build_outlined,
    'other': Icons.auto_awesome_outlined,
  };

  static IconData of(String? key) =>
      key == null ? fallback : (_byKey[key] ?? fallback);
}
