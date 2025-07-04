# home-assistant-custom-automations

## Guides

### Broadlink wifi remote

#### 1. Adding New Commands to Broadlink Remote

- In **Home Assistant**, go to **Developer Tools > Actions**.
- Search for and select the service:  
  ```remote.learn_command```
- Under **Target**, select the **Broadlink remote**.
- In **Device**, enter the name of the device (e.g., `TV`).
- In **Command**, enter the name of the button to register (e.g., `power_on`).
- To register multiple buttons at once, list each button name on a new line. E.g.:
    ```
    - power_on
    - power_off
    ```
- Click **Perform action**.
- Follow the on-screen notifications:
  - Point the original remote at the Broadlink device.
  - Press the button(s) when prompted.
  - For **RF buttons**, change the **Command Type** from `ir` to `rf` before calling the service.

---

##### 2. Testing Commands

- Go to **Developer Tools > Actions**.
- Use the service:  
  ```remote.send_command```
- Select the **Broadlink remote** under **Target**.
- Enter the **Device** and **Command** name you want to test.
- Click **Perform action** to test the command.

---

##### 3. Deleting Commands (Optional)

- Use the service:  
  ```remote.delete_command```
- Select the **Broadlink remote**, device name, and command to delete.
- Click **Perform action**.

---

##### 4. Creating Scripts to Trigger Commands

- In **Configuration > Automations & Scripts > Scripts**, click **Add Script**.
- Name the script and optionally choose an icon.
- Under **Sequence**, set:
  - **Action Type**: `Perform action`
  - **Service**:  
    ```remote.send_command```
  - **Target**: Select your **Broadlink remote**.
  - **Device**: Enter the device name (e.g., `TV`).
  - **Command**: Enter the command name (e.g., `power_on`).
- Optionally set:
  - **Repeats**: To repeat commands (e.g., volume up multiple times).
  - **Delay**: To add delays between commands.
  - **Hold**: To simulate holding a button.
- Save the script.
- Test by running the script.
- Add the script to your **Home Assistant dashboard** for easy access.

---

✅ **Tip:**  
All registered commands are stored in Home Assistant’s hidden `.storage` folder (do **not** edit manually). Use the web interface for any changes.

---

Video: https://www.youtube.com/watch?v=lWCHZm9xWno



### 📝 Aqara KD-R01D (H2 Dimmer EU) Pairing with Zigbee2MQTT

#### ✅ Factory Reset (Important if Previously Paired)
1. **Press the main button 10 times quickly** (within ~5 seconds).
2. The LED will blink **red rapidly** → Device is now **reset**.

#### 🔄 Enter Pairing Mode
1. Put **Zigbee2MQTT** in **Permit Join** mode.
2. **Press the button 5 times quickly**.
3. The LED blinks **purple** → Pairing mode active.

---

#### 🔢 Quick Reference Table

| Action                 | How to Do It                              | LED Response        |
|------------------------|--------------------------------------------|---------------------|
| **Factory Reset**       | Press button **10 times quickly**          | Rapid **red** flash |
| **Enter Pairing Mode**  | Press button **5 times quickly**           | **Purple** blinking |

---

#### 💡 Additional Notes:
- If the LED turns **red** after purple → pairing failed → try again closer to the coordinator.
- Supported Zigbee channels: **11, 15, 20, 25** (avoid channel 26).
- Ensure your **Zigbee2MQTT** and **Zigbee coordinator firmware** are up to date.

---

#### 🔗 Useful Links:
- [Zigbee2MQTT Supported Devices](https://www.zigbee2mqtt.io/supported-devices.html)