From: Matt Ranostay <mranostay@gmail.com>
Subject: Re: [PATCH v2] leds: pca963x: enable low-power state
Date: Wed, 19 Oct 2016 23:15:32 -0700
Message-ID: <90AFFEE8-1022-4A0E-B88C-836DB225C468@gmail.com>
References: <CGME20161020000405eucas1p1db947d4d5abdb1d0cd8fe65b1bfb69af@eucas1p1.samsung.com> <1476921828-4184-1-git-send-email-matt@ranostay.consulting> <b0662ce1-d6ba-19d3-2f8b-49b4dacc3d9b@samsung.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:32940 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753195AbcJTGPf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Oct 2016 02:15:35 -0400
Received: by mail-pf0-f193.google.com with SMTP id i85so4565605pfa.0
        for <linux-leds@vger.kernel.org>; Wed, 19 Oct 2016 23:15:35 -0700 (PDT)
In-Reply-To: <b0662ce1-d6ba-19d3-2f8b-49b4dacc3d9b@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Matt Ranostay <matt@ranostay.consulting>, Tony Lindgren <tony@atomide.com>, Peter Meerwald <p.meerwald@bct-electronic.com>, Ricardo Ribalda <ricardo.ribalda@gmail.com>



> On Oct 19, 2016, at 23:08, Jacek Anaszewski <j.anaszewski@samsung.com> wro=
te:
>=20
> Hi Matt,
>=20
> Thanks for the update.
> Let me cc also authors of the driver.
>=20
>> On 10/20/2016 02:03 AM, Matt Ranostay wrote:
>> Allow chip to enter low power state when no LEDs are being lit or in
>> blink mode.
>>=20
>> Cc: Tony Lindgren <tony@atomide.com>
>> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
>> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
>> ---
>> Changes from v1:
>> * remove runtime pm
>> * count leds that are off, if all then enter low-power state
>>=20
>> drivers/leds/leds-pca963x.c | 24 +++++++++++++++++++++---
>> 1 file changed, 21 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
>> index 407eba11e187..797dffc42c59 100644
>> --- a/drivers/leds/leds-pca963x.c
>> +++ b/drivers/leds/leds-pca963x.c
>> @@ -179,14 +179,32 @@ static void pca963x_blink(struct pca963x_led *pca96=
3x)
>>    mutex_unlock(&pca963x->chip->mutex);
>> }
>>=20
>> +static int pca963x_power_state(struct pca963x_led *pca963x)
>> +{
>> +    int i, leds_on =3D 0;
>> +
>> +    for (i =3D 0; i < pca963x->chip->chipdef->n_leds; i++) {
>> +        if (pca963x->chip->leds[i].led_cdev.brightness > 0)
>> +            leds_on++;
>> +    }
>=20
> You could avoid executing this loop on every brightness setting,
> if you added a counter and incremented/decremented it when turning
> a LED on/off respectively. Then you could write PCA963X_MODE1 on
> counter transitions from 0 to 1 and from 1 to 0.

Thought of that but seems so low bandwidth it wouldn't matter. But have no i=
ssue adding a counter if required of course in v3
>=20
>> +
>> +    return i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE=
1,
>> +                     leds_on ? 0 : BIT(4));
>> +}
>> +
>> static int pca963x_led_set(struct led_classdev *led_cdev,
>>    enum led_brightness value)
>> {
>>    struct pca963x_led *pca963x;
>> +    int ret;
>>=20
>>    pca963x =3D container_of(led_cdev, struct pca963x_led, led_cdev);
>>=20
>> -    return pca963x_brightness(pca963x, value);
>> +    ret =3D pca963x_brightness(pca963x, value);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return pca963x_power_state(pca963x);
>> }
>>=20
>> static int pca963x_blink_set(struct led_classdev *led_cdev,
>> @@ -391,8 +409,8 @@ static int pca963x_probe(struct i2c_client *client,
>>            goto exit;
>>    }
>>=20
>> -    /* Disable LED all-call address and set normal mode */
>> -    i2c_smbus_write_byte_data(client, PCA963X_MODE1, 0x00);
>> +    /* Disable LED all-call address, and power down initially */
>> +    i2c_smbus_write_byte_data(client, PCA963X_MODE1, BIT(4));
>>=20
>>    if (pdata) {
>>        /* Configure output: open-drain or totem pole (push-pull) */
>>=20
>=20
>=20
> --=20
> Best regards,
> Jacek Anaszewski
