alias: Light and Switch Synchronization
description: Ensure the light and switch states are synchronized
triggers:
  - entity_id:
      - light.salon_dimmer_luces
      - switch.salon_interruptor_luces_balconera_up
    trigger: state
actions:
  - service_template: >
      {% if trigger.entity_id == 'light.salon_dimmer_luces' %}
        {% if trigger.to_state.state == 'on' %}
          switch.turn_on
        {% else %}
          switch.turn_off
        {% endif %}
      {% elif trigger.entity_id == 'switch.salon_interruptor_luces_balconera_up'
      %}
        {% if trigger.to_state.state == 'on' %}
          light.turn_on
        {% else %}
          light.turn_off
        {% endif %}
      {% endif %}
    target:
      entity_id: >
        {% if trigger.entity_id == 'light.salon_dimmer_luces' %}
          switch.salon_interruptor_luces_balconera_up
        {% elif trigger.entity_id == 'switch.salon_interruptor_luces_balconera_up'
        %}
          light.salon_dimmer_luces
        {% endif %}
mode: single