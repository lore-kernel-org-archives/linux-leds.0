From: Tony <tony.makkiel@daqri.com>
Subject: Re: [PATCH v8 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Wed, 6 Jul 2016 16:05:22 +0100
Message-ID: <577D1E32.50809@daqri.com>
References: <1467732628-2025-1-git-send-email-tony.makkiel@daqri.com>
 <577D08C7.5000802@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <577D08C7.5000802@samsung.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org, rpurdie@rpsys.net, rjw@rjwysocki.net, lenb@kernel.org, mika.westerberg@linux.intel.com
List-Id: linux-leds@vger.kernel.org

Thank you for the comments Jacek and Mika.

On 06/07/16 14:33, Jacek Anaszewski wrote:


>> +static int lp3952_set_brightness(struct led_classdev *cdev,
>> +                 enum led_brightness value)
>> +{
>> +    unsigned int reg, shift_val;
>> +    struct lp3952_ctrl_hdl *led = container_of(cdev,
>> +                           struct lp3952_ctrl_hdl,
>> +                           cdev);
>> +    struct lp3952_led_array *priv = (struct lp3952_led_array
>> *)led->priv;
>> +
>> +    dev_dbg(cdev->dev, "Brightness request: %d on %d\n", value,
>> +        led->channel);
>> +
>> +    if (value == LED_OFF) {
>> +        lp3952_on_off(priv, led->channel, LED_OFF);
>> +        return 0;
>> +    }
>> +
>> +    if (led->channel > LP3952_RED_1) {
>> +        dev_err(cdev->dev, " %s Invalid LED requested", __func__);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (led->channel >= LP3952_BLUE_1) {
>> +        reg = LP3952_REG_RGB1_MAX_I_CTRL;
>> +        shift_val = (led->channel - LP3952_BLUE_1) * 2;
>> +    } else {
>> +        reg = LP3952_REG_RGB2_MAX_I_CTRL;
>> +        shift_val = led->channel * 2;
>> +    }
>> +
>> +    /* Enable the LED in case it is not enabled already */
>> +    lp3952_on_off(priv, led->channel, 1);
>> +
>> +    return regmap_update_bits(priv->regmap, reg, 3 << shift_val,
>> +                  --value << shift_val);
>
> Here you have two separate calls that change the device state.
> I think that mutex protection is required here to assure that
> the device will not be left in an inconsistent state, due to
> the concurrent calls from other processes.

Sorry, I did not quite understand.

Did you mean 'regmap_update_bits' here and the one within
'lp3952_on_off'? If there isn't a lock assigned by driver, a mutex or
spinlock is assigned based on fast_io support by regmap during init.

>
>> +}
>> +
>> +static int lp3952_get_label(char *dest, const char *label, struct
>> device *dev)
>> +{
>> +    int ret;
>> +    const union acpi_object *obj;
>> +    struct acpi_device *adev = ACPI_COMPANION(dev);
>> +
>> +    ret = acpi_dev_get_property(adev, label, ACPI_TYPE_STRING, &obj);
>> +    if (!ret)
>> +        strncpy(dest, obj->string.pointer, obj->string.length + 1);
>> +
>> +    return ret;
>> +}
>> +
>> +static int lp3952_register_led_classdev(struct lp3952_led_array *priv)
>> +{
>> +    int i, ret = -ENODEV;
>> +    static const char *led_name_hdl[LP3952_LED_ALL] = {
>> +        "blue2",
>> +        "green2",
>> +        "red2",
>> +        "blue1",
>> +        "green1",
>> +        "red1"
>> +    };
>> +
>> +    for (i = 0; i < LP3952_LED_ALL; i++) {
>> +        priv->leds[i].cdev.brightness = LED_OFF;
>> +        priv->leds[i].cdev.max_brightness = LP3952_BRIGHT_MAX;
>> +        priv->leds[i].cdev.brightness_set_blocking =
>> +                lp3952_set_brightness;
>> +        priv->leds[i].channel = i;
>> +        priv->leds[i].priv = priv;
>> +
>> +        ret = lp3952_get_label(priv->leds[i].name, led_name_hdl[i],
>> +                       &priv->client->dev);
>> +        if (ret)
>> +            break;
>
> You're assuming here that all LEDs will always be present, which
> doesn't necessarily have to be true. How about just skipping
> the LED and moving to the next one if given label was not found?
> You could move this check to the beginning of the loop then.

If we skip leds, there could be problem, if all the leds were
skipped(For example, no ACPI name data present).

At present, if a label is not present, the probe will fail.
How about reverting to a default name (eg: "lp3952:blue2") if led name
read fails? This would also cover cases in which none of the led names
were read properly.

>
>> +
>> +        priv->leds[i].cdev.name = priv->leds[i].name;
>> +
>> +        ret = devm_led_classdev_register(&priv->client->dev,
>> +                         &priv->leds[i].cdev);
>> +        if (ret < 0) {
>> +            dev_err(&priv->client->dev,
>> +                "couldn't register LED %s\n",
>> +                priv->leds[i].cdev.name);
>> +            break;
>> +        }
>> +    }
>> +    return ret;
>> +}
>> +
