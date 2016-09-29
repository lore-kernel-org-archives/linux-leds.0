From: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] leds: Add driver for NCP5623 3-channel I2C LED
 driver
Date: Thu, 29 Sep 2016 19:13:57 +0200
Message-ID: <d8f9d69d-df6c-f24e-dd78-30501c9fc1b6@gmail.com>
References: <1474025672-5040-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1474025672-5040-3-git-send-email-florian.vaussard@heig-vd.ch>
 <d6dfc1aa-941d-fdbb-5fda-74c85b571bc5@gmail.com>
 <4990cd83-ae67-aec4-ae8b-4d0db3cbc9fe@gmail.com>
Reply-To: florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------015CDFF30A56DCF7AB3C61D2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4990cd83-ae67-aec4-ae8b-4d0db3cbc9fe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

This is a multi-part message in MIME format.
--------------015CDFF30A56DCF7AB3C61D2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Replying to my self after thinking twice...

Le 29. 09. 16 à 18:18, Florian Vaussard a écrit :
> Hi Jacek,
> 
> Thank you for your comments!
> 
> Le 18. 09. 16 à 20:20, Jacek Anaszewski a écrit :
>> Hi Florian,
>>
>> Thanks for the updated patch set. I have few comments below.
>>
>> On 09/16/2016 01:34 PM, Florian Vaussard wrote:
>>> The NCP5623 is a 3-channel LED driver from On Semiconductor controlled
>>> through I2C. The PWM of each channel can be independently set with 32
>>> distinct levels. In addition, the intensity of the current source can be
>>> globally set using an external bias resistor fixing the reference
>>> current (Iref) and a dedicated register (ILED), following the
>>> relationship:
>>>
>>> I = 2400*Iref/(31-ILED)
>>>
>>> with Iref = Vref/Rbias, and Vref = 0.6V.
>>>
>>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>>> ---
>>>  drivers/leds/Kconfig        |  11 +++
>>>  drivers/leds/Makefile       |   1 +
>>>  drivers/leds/leds-ncp5623.c | 234 ++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 246 insertions(+)
>>>  create mode 100644 drivers/leds/leds-ncp5623.c
>>>

[...]

>>> +static int ncp5623_configure(struct device *dev,
>>> +                 struct ncp5623_priv *priv)
>>> +{
>>> +    unsigned int i;
>>> +    unsigned int n;
>>> +    struct ncp5623_led *led;
>>> +    int effective_current;
>>> +    int err;
>>
>> Below way of calculating max_brightness is not clear to me.
>> Let's analyze it below, using values from your DT example.
>>
>>> +
>>> +    /* Setup the internal current source, round down */
>>> +    n = 2400 * priv->led_iref / priv->leds_max_current + 1;
>>
>> n = 2400 * 10 / 20000 + 1 = 2
>>
>>> +    if (n > NCP5623_MAX_CURRENT)
>>> +        n = NCP5623_MAX_CURRENT;
>>> +
>>> +    effective_current = 2400 * priv->led_iref / n;
>>
>> effective_current = 2400 * 10 / 2 = 12000
>>
>>> +    dev_dbg(dev, "setting maximum current to %u uA\n", effective_current);
>>> +
>>> +    err = ncp5623_send_cmd(priv, CMD_ILED, NCP5623_MAX_CURRENT - n);
>>> +    if (err < 0) {
>>> +        dev_err(dev, "cannot set the current\n");
>>> +        return err;
>>> +    }
>>> +
>>> +    /* Setup each individual LED */
>>> +    for (i = 0; i < NCP5623_MAX_LEDS; i++) {
>>> +        led = &priv->leds[i];
>>> +
>>> +        if (led->led_no < 0)
>>> +            continue;
>>> +
>>> +        led->priv = priv;
>>> +        led->ldev.brightness_set_blocking = ncp5623_brightness_set;
>>> +
>>> +        led->ldev.max_brightness = led->led_max_current *
>>> +            NCP5623_MAX_STEPS / effective_current;
>>
>> led->ldev.max_brightness = 20000 * 31 / 12000 = 51
>>
>> This is not intuitive, and I'm not even sure if the result is in line
>> with what you intended.
>>
> 
> There is indeed a problem in the case the allowed current on the LED is greater
> than the effective current provided by the current source, as in your example.
> Here I should put something like:
> 
> 	led->ldev.max_brightness =
> 		min(NCP5623_MAX_STEPS, x * NCP5623_MAX_STEPS / y);
> 
>> Instead I propose the following:
>>
>> n_iled_max =
>>      31 - (priv->led_iref * 2400 / priv->leds_max_current +
>>            !!(priv->led_iref * 2400 % priv->leds_max_current))
>>
>> (n_iled_max =
>>      31 - (24000 / 20000 + !!(24000 % 20000)) = 31 - (1 + 1) = 29)
>>
>> ncp5623_send_cmd(priv, CMD_ILED, n_iled_max)
>>
> 
> This is a good proposition, especially with the DIV_ROUND_UP proposed by Pavel.
> I simulated both and I noticed a problem in both cases for very low currents, as
> we would have negative values for the register setting (see attached figure). I
> will fix this in the next version.
> 

In fact my original solution does not have this problem because of the (n >
NCP5623_MAX_CURRENT) check and clipping before computing the effective current.
This was not included in my simulation, here is the updated graph. So I will
enhance your solution to avoid this exact problem.

Best,
Florian

--------------015CDFF30A56DCF7AB3C61D2
Content-Type: application/pdf;
 name="current-comparison.pdf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="current-comparison.pdf"

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
ZXh0XQovRXh0R1N0YXRlIDkgMCBSCi9Gb250IDEwIDAgUgo+PgovQ29udGVudHMgNSAwIFIK
Pj4KZW5kb2JqCjMgMCBvYmoKPDwgL1R5cGUgL1BhZ2VzIC9LaWRzIFsKNCAwIFIKXSAvQ291
bnQgMQo+PgplbmRvYmoKMSAwIG9iago8PC9UeXBlIC9DYXRhbG9nIC9QYWdlcyAzIDAgUgov
TWV0YWRhdGEgMTEgMCBSCj4+CmVuZG9iago3IDAgb2JqCjw8L1R5cGUvRXh0R1N0YXRlCi9P
UE0gMT4+ZW5kb2JqCjkgMCBvYmoKPDwvUjcKNyAwIFI+PgplbmRvYmoKMTAgMCBvYmoKPDwv
UjgKOCAwIFI+PgplbmRvYmoKOCAwIG9iago8PC9CYXNlRm9udC9IZWx2ZXRpY2EvVHlwZS9G
b250Ci9TdWJ0eXBlL1R5cGUxPj4KZW5kb2JqCjExIDAgb2JqCjw8L1R5cGUvTWV0YWRhdGEK
L1N1YnR5cGUvWE1ML0xlbmd0aCAxNDQzPj5zdHJlYW0KPD94cGFja2V0IGJlZ2luPSfvu78n
IGlkPSdXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQnPz4KPD9hZG9iZS14YXAtZmlsdGVycyBl
c2M9IkNSTEYiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSdhZG9iZTpuczptZXRhLycgeDp4bXB0
az0nWE1QIHRvb2xraXQgMi45LjEtMTMsIGZyYW1ld29yayAxLjYnPgo8cmRmOlJERiB4bWxu
czpyZGY9J2h0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMnIHht
bG5zOmlYPSdodHRwOi8vbnMuYWRvYmUuY29tL2lYLzEuMC8nPgo8cmRmOkRlc2NyaXB0aW9u
IHJkZjphYm91dD0ndXVpZDo3M2U4MmFjYi1iZTg0LTExZjEtMDAwMC02NjlkN2E5MzQzNjYn
IHhtbG5zOnBkZj0naHR0cDovL25zLmFkb2JlLmNvbS9wZGYvMS4zLycgcGRmOlByb2R1Y2Vy
PSdHUEwgR2hvc3RzY3JpcHQgOS4xNicvPgo8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0n
dXVpZDo3M2U4MmFjYi1iZTg0LTExZjEtMDAwMC02NjlkN2E5MzQzNjYnIHhtbG5zOnhtcD0n
aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyc+PHhtcDpNb2RpZnlEYXRlPjIwMTYtMDkt
MjlUMTk6MTI6MzArMDI6MDA8L3htcDpNb2RpZnlEYXRlPgo8eG1wOkNyZWF0ZURhdGU+MjAx
Ni0wOS0yOVQxOToxMjozMCswMjowMDwveG1wOkNyZWF0ZURhdGU+Cjx4bXA6Q3JlYXRvclRv
b2w+R0wyUFMgMS4zLjksIChDKSAxOTk5LTIwMTUgQy4gR2V1emFpbmU8L3htcDpDcmVhdG9y
VG9vbD48L3JkZjpEZXNjcmlwdGlvbj4KPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9J3V1
aWQ6NzNlODJhY2ItYmU4NC0xMWYxLTAwMDAtNjY5ZDdhOTM0MzY2JyB4bWxuczp4YXBNTT0n
aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLycgeGFwTU06RG9jdW1lbnRJRD0ndXVp
ZDo3M2U4MmFjYi1iZTg0LTExZjEtMDAwMC02NjlkN2E5MzQzNjYnLz4KPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9J3V1aWQ6NzNlODJhY2ItYmU4NC0xMWYxLTAwMDAtNjY5ZDdhOTM0
MzY2JyB4bWxuczpkYz0naHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8nIGRjOmZv
cm1hdD0nYXBwbGljYXRpb24vcGRmJz48ZGM6dGl0bGU+PHJkZjpBbHQ+PHJkZjpsaSB4bWw6
bGFuZz0neC1kZWZhdWx0Jz5nbHBzX3JlbmRlcmVyIGZpZ3VyZTwvcmRmOmxpPjwvcmRmOkFs
dD48L2RjOnRpdGxlPjxkYzpjcmVhdG9yPjxyZGY6U2VxPjxyZGY6bGk+T2N0YXZlPC9yZGY6
bGk+PC9yZGY6U2VxPjwvZGM6Y3JlYXRvcj48L3JkZjpEZXNjcmlwdGlvbj4KPC9yZGY6UkRG
Pgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo8
P3hwYWNrZXQgZW5kPSd3Jz8+CmVuZHN0cmVhbQplbmRvYmoKMiAwIG9iago8PC9Qcm9kdWNl
cihHUEwgR2hvc3RzY3JpcHQgOS4xNikKL0NyZWF0aW9uRGF0ZShEOjIwMTYwOTI5MTkxMjMw
KzAyJzAwJykKL01vZERhdGUoRDoyMDE2MDkyOTE5MTIzMCswMicwMCcpCi9UaXRsZShnbHBz
X3JlbmRlcmVyIGZpZ3VyZSkKL0NyZWF0b3IoR0wyUFMgMS4zLjksIFwoQ1wpIDE5OTktMjAx
NSBDLiBHZXV6YWluZSkKL0F1dGhvcihPY3RhdmUpPj5lbmRvYmoKeHJlZgowIDEyCjAwMDAw
MDAwMDAgNjU1MzUgZiAKMDAwMDAwMTk1OSAwMDAwMCBuIAowMDAwMDAzNzA4IDAwMDAwIG4g
CjAwMDAwMDE5MDAgMDAwMDAgbiAKMDAwMDAwMTc1MCAwMDAwMCBuIAowMDAwMDAwMDE1IDAw
MDAwIG4gCjAwMDAwMDE3MzAgMDAwMDAgbiAKMDAwMDAwMjAyNCAwMDAwMCBuIAowMDAwMDAy
MTI0IDAwMDAwIG4gCjAwMDAwMDIwNjUgMDAwMDAgbiAKMDAwMDAwMjA5NCAwMDAwMCBuIAow
MDAwMDAyMTg4IDAwMDAwIG4gCnRyYWlsZXIKPDwgL1NpemUgMTIgL1Jvb3QgMSAwIFIgL0lu
Zm8gMiAwIFIKL0lEIFs8MzNEQzRDRkRDQkZEMEZDNjYwRjExMzg1RDk5RjNCRTQ+PDMzREM0
Q0ZEQ0JGRDBGQzY2MEYxMTM4NUQ5OUYzQkU0Pl0KPj4Kc3RhcnR4cmVmCjM5MjcKJSVFT0YK

--------------015CDFF30A56DCF7AB3C61D2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
