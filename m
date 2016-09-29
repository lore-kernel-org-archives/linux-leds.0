From: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] leds: Add driver for NCP5623 3-channel I2C LED
 driver
Date: Thu, 29 Sep 2016 18:18:48 +0200
Message-ID: <4990cd83-ae67-aec4-ae8b-4d0db3cbc9fe@gmail.com>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-3-git-send-email-florian.vaussard@heig-vd.ch>
 <d6dfc1aa-941d-fdbb-5fda-74c85b571bc5@gmail.com>
Reply-To: florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------0A2041C56718E18C9F7B5AEC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d6dfc1aa-941d-fdbb-5fda-74c85b571bc5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This is a multi-part message in MIME format.
--------------0A2041C56718E18C9F7B5AEC
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hi Jacek,

Thank you for your comments!

Le 18. 09. 16 à 20:20, Jacek Anaszewski a écrit :
> Hi Florian,
> 
> Thanks for the updated patch set. I have few comments below.
> 
> On 09/16/2016 01:34 PM, Florian Vaussard wrote:
>> The NCP5623 is a 3-channel LED driver from On Semiconductor controlled
>> through I2C. The PWM of each channel can be independently set with 32
>> distinct levels. In addition, the intensity of the current source can be
>> globally set using an external bias resistor fixing the reference
>> current (Iref) and a dedicated register (ILED), following the
>> relationship:
>>
>> I = 2400*Iref/(31-ILED)
>>
>> with Iref = Vref/Rbias, and Vref = 0.6V.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>> ---
>>  drivers/leds/Kconfig        |  11 +++
>>  drivers/leds/Makefile       |   1 +
>>  drivers/leds/leds-ncp5623.c | 234 ++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 246 insertions(+)
>>  create mode 100644 drivers/leds/leds-ncp5623.c
>>

[...]

>> diff --git a/drivers/leds/leds-ncp5623.c b/drivers/leds/leds-ncp5623.c
>> new file mode 100644
>> index 0000000..875785a
>> --- /dev/null
>> +++ b/drivers/leds/leds-ncp5623.c
>> @@ -0,0 +1,234 @@
>> +/*
>> + * Copyright 2016 Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>> + *
>> + * Based on leds-tlc591xx.c
> 
> I think that besides LED class facilities the only
> common thing is led_no. I'd skip this statement.
> 
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; version 2 of the License.
>> + */
>> +
>> +#include <linux/bitops.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/slab.h>
>> +
>> +#define NCP5623_MAX_LEDS    3
>> +#define NCP5623_MAX_STEPS    31
>> +#define NCP5623_MAX_CURRENT    31
> 
> Both values refer in fact to the same thing.
> And actually the name is not accurate since max current level
> is 30.
> 

They do not refer to the same thing:

* NCP5623_MAX_STEPS is the maximum number of PWM steps (0x1F -> 100% duty cycle)
* NCP5623_MAX_CURRENT is related to the current delivered by the current source
(0x1F -> ILED = ILEDmax = 2400*Iref). In this case, 30 and 31 give the same ILED
according to the remark in Eq. 2 and according to Fig. 5 in the datasheet, but
31 is still a valid value.

>> +#define NCP5623_MAX_CURRENT_UA    30000
>> +
>> +#define NCP5623_CMD_SHIFT    5
>> +#define CMD_SHUTDOWN        (0x00 << NCP5623_CMD_SHIFT)
>> +#define CMD_ILED        (0x01 << NCP5623_CMD_SHIFT)
>> +#define CMD_PWM1        (0x02 << NCP5623_CMD_SHIFT)
>> +#define CMD_PWM2        (0x03 << NCP5623_CMD_SHIFT)
>> +#define CMD_PWM3        (0x04 << NCP5623_CMD_SHIFT)
>> +#define CMD_UPWARD_DIM        (0x05 << NCP5623_CMD_SHIFT)
>> +#define CMD_DOWNWARD_DIM    (0x06 << NCP5623_CMD_SHIFT)
>> +#define CMD_DIM_STEP        (0x07 << NCP5623_CMD_SHIFT)
>> +
>> +#define LED_TO_PWM_CMD(led)    ((0x02 + led) << NCP5623_CMD_SHIFT)
>> +
>> +#define NCP5623_DATA_MASK    GENMASK(NCP5623_CMD_SHIFT - 1, 0)
>> +#define NCP5623_CMD(cmd, data)    (cmd | (data & NCP5623_DATA_MASK))
>> +
>> +struct ncp5623_led {
>> +    int led_no;
>> +    u32 led_max_current;
>> +    struct led_classdev ldev;
>> +    struct ncp5623_priv *priv;
>> +};
>> +
>> +struct ncp5623_priv {
>> +    struct ncp5623_led leds[NCP5623_MAX_LEDS];
>> +    u32 led_iref;
>> +    u32 leds_max_current;
>> +    struct i2c_client *client;
>> +};
>> +
>> +static struct ncp5623_led *ldev_to_led(struct led_classdev *ldev)
>> +{
>> +    return container_of(ldev, struct ncp5623_led, ldev);
>> +}
>> +
>> +static int ncp5623_send_cmd(struct ncp5623_priv *priv, u8 cmd, u8 data)
>> +{
>> +    char cmd_data[1] = { NCP5623_CMD(cmd, data) };
>> +    int err;
>> +
>> +    err = i2c_master_send(priv->client, cmd_data, ARRAY_SIZE(cmd_data));
>> +
>> +    return (err < 0 ? err : 0);
>> +}
>> +
>> +static int ncp5623_brightness_set(struct led_classdev *led_cdev,
>> +                  enum led_brightness brightness)
>> +{
>> +    struct ncp5623_led *led = ldev_to_led(led_cdev);
>> +
>> +    return ncp5623_send_cmd(led->priv, LED_TO_PWM_CMD(led->led_no),
>> +                brightness);
>> +}
>> +
>> +static int ncp5623_configure(struct device *dev,
>> +                 struct ncp5623_priv *priv)
>> +{
>> +    unsigned int i;
>> +    unsigned int n;
>> +    struct ncp5623_led *led;
>> +    int effective_current;
>> +    int err;
> 
> Below way of calculating max_brightness is not clear to me.
> Let's analyze it below, using values from your DT example.
> 
>> +
>> +    /* Setup the internal current source, round down */
>> +    n = 2400 * priv->led_iref / priv->leds_max_current + 1;
> 
> n = 2400 * 10 / 20000 + 1 = 2
> 
>> +    if (n > NCP5623_MAX_CURRENT)
>> +        n = NCP5623_MAX_CURRENT;
>> +
>> +    effective_current = 2400 * priv->led_iref / n;
> 
> effective_current = 2400 * 10 / 2 = 12000
> 
>> +    dev_dbg(dev, "setting maximum current to %u uA\n", effective_current);
>> +
>> +    err = ncp5623_send_cmd(priv, CMD_ILED, NCP5623_MAX_CURRENT - n);
>> +    if (err < 0) {
>> +        dev_err(dev, "cannot set the current\n");
>> +        return err;
>> +    }
>> +
>> +    /* Setup each individual LED */
>> +    for (i = 0; i < NCP5623_MAX_LEDS; i++) {
>> +        led = &priv->leds[i];
>> +
>> +        if (led->led_no < 0)
>> +            continue;
>> +
>> +        led->priv = priv;
>> +        led->ldev.brightness_set_blocking = ncp5623_brightness_set;
>> +
>> +        led->ldev.max_brightness = led->led_max_current *
>> +            NCP5623_MAX_STEPS / effective_current;
> 
> led->ldev.max_brightness = 20000 * 31 / 12000 = 51
> 
> This is not intuitive, and I'm not even sure if the result is in line
> with what you intended.
> 

There is indeed a problem in the case the allowed current on the LED is greater
than the effective current provided by the current source, as in your example.
Here I should put something like:

	led->ldev.max_brightness =
		min(NCP5623_MAX_STEPS, x * NCP5623_MAX_STEPS / y);

> Instead I propose the following:
> 
> n_iled_max =
>      31 - (priv->led_iref * 2400 / priv->leds_max_current +
>            !!(priv->led_iref * 2400 % priv->leds_max_current))
> 
> (n_iled_max =
>      31 - (24000 / 20000 + !!(24000 % 20000)) = 31 - (1 + 1) = 29)
> 
> ncp5623_send_cmd(priv, CMD_ILED, n_iled_max)
> 

This is a good proposition, especially with the DIV_ROUND_UP proposed by Pavel.
I simulated both and I noticed a problem in both cases for very low currents, as
we would have negative values for the register setting (see attached figure). I
will fix this in the next version.

> and then below for each LED:
> 
> led->ldev.max_brightness =
>      31 - (priv->led_iref * 2400 / led->led_max_current +
>            !!(priv->led_iref * 2400 % led->led_max_current))
> 
> (for led-max-microamp = 5000
>  led->ldev.max_brightness =
>  31 - (24000 / 5000 + !!(24000 % 5000)) = 31 - (4 + 1) = 26,
>  which reflects quite well the logarithmic relation shown
>  on Figure 5 in the documentation)
> 

Here you are mixing the current source and the PWM settings together. For
example, if my current source was set to 20mA at the previous stage, but my LED
can only sustain 10mA, I must limit the PWM duty cycle to 50%. Thus:

max_brightness = 10mA * 31 / 20mA = 15

(0 => 0% duty cycle, 31 => 100% duty cycle)

Best regards,
Florian

--------------0A2041C56718E18C9F7B5AEC
Content-Type: application/pdf;
 name="current-comparison.pdf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="current-comparison.pdf"

JVBERi0xLjUKJcfsj6IKNSAwIG9iago8PC9MZW5ndGggNiAwIFIvRmlsdGVyIC9GbGF0ZURl
Y29kZT4+CnN0cmVhbQp4nM1ZTW8bNxC976/YW52DGXL4tTy2aFCg6CVe3YwcAlkOnNpJI8fu
3+/we7hfktocCsOW9mn4lnyPnJ2xvvWciZ77n/S6f+re3tj+03Mnev9z/NQ5GNjARa+klMzZ
/qnT0gEbCvBYQrS1A5MeuZ8GlVE1ZmmUdM4yLnGYEUzJMMxoJlVBHmuMUcCMTHdro8i4ErU0
Ls8BwGoGdZbpuk5SWuGYoSubDikRC0PyrUFyvLUh08tInR7oQbLBNMtaGFeilsbd9sJ4Oz/g
712n+7+7YHJ/89s5do4zaxbcGxeY5o6OZ+yDEafLe8l7sfQ3L+K8uwlj27slgMaAEqaJSQCN
kahfE5OAJsZx1cZEgMbgXhuamARcrhA1dF0LJXGM1SsmVgTHmU3BKNFEQyJqoVnTlNJMZCa6
F5o12SnNxAliTaVZcaahac0i7hWaNfMozcRPYnChWfOX0kwsJ3ug0MQTjAn5Wyfi+/Syf+p/
2WHaHjywu+9iJhe980ldCSQcoN89dbdX/M214Zozrq8053ilnLTMuSvB46Ux/Ero+h4IDgSX
Af+w+717t+ve/8vzu5F3lAH8SJOgBDRBTghmJQlKQLP5cQnMCKJoApogNTimHAlKwNm58OT5
tJKpdq0L2wJ3joATgmQmIshEI8K0qVpmIqpNhCRMm9ImJirtRO3KtK1/ZiL6TywhTJsmZaZ5
oqVGJiYSdO7p8vRgUBm8s0S38IBd4el6s/uMJ9XPZhhkv7tDUFHQughCAD3ilG4+Ch9ca6a1
s7ZhggWiSC4cpi6sD64FVgdK6/DRr4fnh+Phrt+/HI+HL9/725efP0QCgYG4CGPZYDWWSLgW
gwWRX8LN4dPD8/fDsX/9+Phy8OHphMedHdfuywi/foXbSaF0yhssOKYajvJybZjwYgpugFlv
ufYaeURwy6TpUXiNWSgg2juJ5c0gw6UzzChEFJL4xCfwKcHA+2/zEBg0c9R/ISVnGml1yHYB
CcUZARQWYwMSa5lvhZk67BBkZhDmq7kL24EgWjLribGstH7TCqMk46pBBsuM57F5ygMIZhrA
GAZ+EOZkDwD3U6eAkCqIh/k5rhKswOk1gHbhzkakZSvMyM2lUkE74/OHX2Le8AUITxGmUyVY
LPRRprHQ4rTghIU4HeKgyJJd4qDmODG17WD16wc5qN3A1KKlxS+L75xZsvQCA41x4c5zS4tj
eFSDllNLNwxsnzSlrD+ncRpnLdBSmzQucM1bp/Gsluv8dKpAMzvgo0cDAxlz0f3j1+PDxy9s
//wakhwKbDiWMn90V58/7g9/Xt89vF4fv758uXv5KwT9tJKsML0or6/SWLdKP1WFHZWfdEYm
R6MMUDI9CMuAhGxYcbKnHKct4ryHHOcss7Zy7E51opd1Vlt3ShV/CUnXJCIV8yUiXZOIVKeX
iHRNI2IJXiPiNYlI1XWJSNcXarJUq81WDxJHuGHZrwIYizOELY0oTytblZGwrOhIWVppq9SE
ZUVrytLKX+2gLMt+NCyNRdUywrLiGWVpbay2EpYVXylLa3W1nrBc1DuBAIbVzP+ndzojo4AW
2j8qakwCmiCLJZohrUwGmiCf8xWJidfNcQCJ9TO5WQaaIF8hDuRmGTgzEZ46rrHOJ1LMd0qs
8jfVyjRErYmAhGhT0sxEJJ2oTJi2dM9EVffWCUKzZU2iodZM3KpE2/5lJuLfxFLCtGVyJppl
bbINEk0NOffoDvhAF1hKAva+OvzjI7VUwkuNtuGjnVssU3yPFM5l02+RD+PJji1XgCOql1CY
xCqI8GKwzMGAXbVWl/ZtWNGGvg3wjZRxie/u7w/77w+vh9mw7f4NwBeymhT/WOjI2Azn4h9z
LGY6TYp/8OW6GHL1DxIraKFI9Q9SWz+0Vv+AVqZuLVX/uNc4A0Gqf1B4a21q9U+AVP2DfzWK
VP+gFNJoUv1TJFb/oLDXtY4U+xSJ/RtaZZistT65jt0baBNK/Fr9EySV/1j089i/pGKfArF/
w9WDby5SsU8vY/+GYvKoXTldGVjs34KFRrUW4mzcKQshPjizhZhC4GIL8UEZ/oW5YWE17AdZ
GBu4BU+LY6l/m1t6kYOpgZt7Wi1LDdzE000HRekTZv6devjNur2t75PG2TdDS98ejQtc82+U
xhn/Mtel3R56yCTulpVuD43+D90ePqbDVqzNW0ZWuj3c38FFMiAhfsD77h8RAs6TZW5kc3Ry
ZWFtCmVuZG9iago2IDAgb2JqCjE2NTQKZW5kb2JqCjQgMCBvYmoKPDwvVHlwZS9QYWdlL01l
ZGlhQm94IFswIDAgNjEyIDc5Ml0KL1BhcmVudCAzIDAgUgovUmVzb3VyY2VzPDwvUHJvY1Nl
dFsvUERGIC9UZXh0XQovRXh0R1N0YXRlIDkgMCBSCi9Gb250IDEwIDAgUgo+PgovQ29udGVu
dHMgNSAwIFIKPj4KZW5kb2JqCjMgMCBvYmoKPDwgL1R5cGUgL1BhZ2VzIC9LaWRzIFsKNCAw
IFIKXSAvQ291bnQgMQo+PgplbmRvYmoKMSAwIG9iago8PC9UeXBlIC9DYXRhbG9nIC9QYWdl
cyAzIDAgUgovTWV0YWRhdGEgMTEgMCBSCj4+CmVuZG9iago3IDAgb2JqCjw8L1R5cGUvRXh0
R1N0YXRlCi9PUE0gMT4+ZW5kb2JqCjkgMCBvYmoKPDwvUjcKNyAwIFI+PgplbmRvYmoKMTAg
MCBvYmoKPDwvUjgKOCAwIFI+PgplbmRvYmoKOCAwIG9iago8PC9CYXNlRm9udC9IZWx2ZXRp
Y2EvVHlwZS9Gb250Ci9TdWJ0eXBlL1R5cGUxPj4KZW5kb2JqCjExIDAgb2JqCjw8L1R5cGUv
TWV0YWRhdGEKL1N1YnR5cGUvWE1ML0xlbmd0aCAxNDQzPj5zdHJlYW0KPD94cGFja2V0IGJl
Z2luPSfvu78nIGlkPSdXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQnPz4KPD9hZG9iZS14YXAt
ZmlsdGVycyBlc2M9IkNSTEYiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSdhZG9iZTpuczptZXRh
LycgeDp4bXB0az0nWE1QIHRvb2xraXQgMi45LjEtMTMsIGZyYW1ld29yayAxLjYnPgo8cmRm
OlJERiB4bWxuczpyZGY9J2h0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRh
eC1ucyMnIHhtbG5zOmlYPSdodHRwOi8vbnMuYWRvYmUuY29tL2lYLzEuMC8nPgo8cmRmOkRl
c2NyaXB0aW9uIHJkZjphYm91dD0ndXVpZDo5ZTM1ZWEyOS1iZTdjLTExZjEtMDAwMC1mNzk3
ZDJhMWQxODYnIHhtbG5zOnBkZj0naHR0cDovL25zLmFkb2JlLmNvbS9wZGYvMS4zLycgcGRm
OlByb2R1Y2VyPSdHUEwgR2hvc3RzY3JpcHQgOS4xNicvPgo8cmRmOkRlc2NyaXB0aW9uIHJk
ZjphYm91dD0ndXVpZDo5ZTM1ZWEyOS1iZTdjLTExZjEtMDAwMC1mNzk3ZDJhMWQxODYnIHht
bG5zOnhtcD0naHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyc+PHhtcDpNb2RpZnlEYXRl
PjIwMTYtMDktMjlUMTg6MTY6MjUrMDI6MDA8L3htcDpNb2RpZnlEYXRlPgo8eG1wOkNyZWF0
ZURhdGU+MjAxNi0wOS0yOVQxODoxNjoyNSswMjowMDwveG1wOkNyZWF0ZURhdGU+Cjx4bXA6
Q3JlYXRvclRvb2w+R0wyUFMgMS4zLjksIChDKSAxOTk5LTIwMTUgQy4gR2V1emFpbmU8L3ht
cDpDcmVhdG9yVG9vbD48L3JkZjpEZXNjcmlwdGlvbj4KPHJkZjpEZXNjcmlwdGlvbiByZGY6
YWJvdXQ9J3V1aWQ6OWUzNWVhMjktYmU3Yy0xMWYxLTAwMDAtZjc5N2QyYTFkMTg2JyB4bWxu
czp4YXBNTT0naHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLycgeGFwTU06RG9jdW1l
bnRJRD0ndXVpZDo5ZTM1ZWEyOS1iZTdjLTExZjEtMDAwMC1mNzk3ZDJhMWQxODYnLz4KPHJk
ZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9J3V1aWQ6OWUzNWVhMjktYmU3Yy0xMWYxLTAwMDAt
Zjc5N2QyYTFkMTg2JyB4bWxuczpkYz0naHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEu
MS8nIGRjOmZvcm1hdD0nYXBwbGljYXRpb24vcGRmJz48ZGM6dGl0bGU+PHJkZjpBbHQ+PHJk
ZjpsaSB4bWw6bGFuZz0neC1kZWZhdWx0Jz5nbHBzX3JlbmRlcmVyIGZpZ3VyZTwvcmRmOmxp
PjwvcmRmOkFsdD48L2RjOnRpdGxlPjxkYzpjcmVhdG9yPjxyZGY6U2VxPjxyZGY6bGk+T2N0
YXZlPC9yZGY6bGk+PC9yZGY6U2VxPjwvZGM6Y3JlYXRvcj48L3JkZjpEZXNjcmlwdGlvbj4K
PC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAo8P3hwYWNrZXQgZW5kPSd3Jz8+CmVuZHN0cmVhbQplbmRvYmoKMiAwIG9iago8
PC9Qcm9kdWNlcihHUEwgR2hvc3RzY3JpcHQgOS4xNikKL0NyZWF0aW9uRGF0ZShEOjIwMTYw
OTI5MTgxNjI1KzAyJzAwJykKL01vZERhdGUoRDoyMDE2MDkyOTE4MTYyNSswMicwMCcpCi9U
aXRsZShnbHBzX3JlbmRlcmVyIGZpZ3VyZSkKL0NyZWF0b3IoR0wyUFMgMS4zLjksIFwoQ1wp
IDE5OTktMjAxNSBDLiBHZXV6YWluZSkKL0F1dGhvcihPY3RhdmUpPj5lbmRvYmoKeHJlZgow
IDEyCjAwMDAwMDAwMDAgNjU1MzUgZiAKMDAwMDAwMTk2OCAwMDAwMCBuIAowMDAwMDAzNzE3
IDAwMDAwIG4gCjAwMDAwMDE5MDkgMDAwMDAgbiAKMDAwMDAwMTc1OSAwMDAwMCBuIAowMDAw
MDAwMDE1IDAwMDAwIG4gCjAwMDAwMDE3MzkgMDAwMDAgbiAKMDAwMDAwMjAzMyAwMDAwMCBu
IAowMDAwMDAyMTMzIDAwMDAwIG4gCjAwMDAwMDIwNzQgMDAwMDAgbiAKMDAwMDAwMjEwMyAw
MDAwMCBuIAowMDAwMDAyMTk3IDAwMDAwIG4gCnRyYWlsZXIKPDwgL1NpemUgMTIgL1Jvb3Qg
MSAwIFIgL0luZm8gMiAwIFIKL0lEIFs8ODAzOUI0RTcxN0E1RDVCMjRDNjI2Q0ZGQTlDMTU4
QUE+PDgwMzlCNEU3MTdBNUQ1QjI0QzYyNkNGRkE5QzE1OEFBPl0KPj4Kc3RhcnR4cmVmCjM5
MzYKJSVFT0YK
--------------0A2041C56718E18C9F7B5AEC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
