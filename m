From: Ben Gamari <bgamari.foss@gmail.com>
Subject: Re: [PATCH] leds/leds-pwm: Display error code on request_pwm failure
Date: Mon, 16 Dec 2013 23:05:34 -0500
Message-ID: <87vbyoyve9.fsf@gmail.com>
References: <1387238932-18982-1-git-send-email-bgamari.foss@gmail.com> <CAK5ve-L77knnYe8vfRByNgT6cE=7WozvCGbvfXVCWMAfcFYqYQ@mail.gmail.com> <CAK5ve-Jteb3UcBAhT6qJ=ZOwpzSw04iZGHkOofYkua3tfKdHQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:55549 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169Ab3LQEFk (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2013 23:05:40 -0500
Received: by mail-qa0-f53.google.com with SMTP id j5so2228994qaq.12
        for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2013 20:05:39 -0800 (PST)
In-Reply-To: <CAK5ve-Jteb3UcBAhT6qJ=ZOwpzSw04iZGHkOofYkua3tfKdHQw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

--=-=-=
Content-Type: text/plain

Bryan Wu <cooloney@gmail.com> writes:

> On Mon, Dec 16, 2013 at 5:26 PM, Bryan Wu <cooloney@gmail.com> wrote:
>> On Mon, Dec 16, 2013 at 4:08 PM, Ben Gamari <bgamari.foss@gmail.com> wrote:
>>> This can be useful in debugging devicetrees.
>>>
>>
>> OK, I will merge this.
>>
>
>
>> Thanks,
>> -Bryan
>>
>>> Signed-off-by: Ben Gamari <bgamari.foss@gmail.com>
>>> ---
>>>  drivers/leds/leds-pwm.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
>>> index b31d8e9..707a82a 100644
>>> --- a/drivers/leds/leds-pwm.c
>>> +++ b/drivers/leds/leds-pwm.c
>>> @@ -165,8 +165,8 @@ static int led_pwm_probe(struct platform_device *pdev)
>>>                         if (IS_ERR(led_dat->pwm)) {
>>>                                 ret = PTR_ERR(led_dat->pwm);
>>>                                 dev_err(&pdev->dev,
>>> -                                       "unable to request PWM for %s\n",
>>> -                                       cur_led->name);
>>> +                                       "unable to request PWM for %s: error=%d\n",
>
> Oh, hold on, this line has more than 80 characters. Please fix this
> coding style error.
>
Would this not fall under the "unless" clause of the kernel style guidelines,

    Statements longer than 80 columns will be broken into sensible chunks, unless
    exceeding 80 columns significantly increases readability and does not hide
    information.

The line is 82 characters long by my count and there is no reasonable
way to break it. The only fix I can think of here is to introduce a
local variable for the format string but in my opinion this is far less
readable than what we currently have. Which would you prefer?

Cheers,

- Ben

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQEcBAEBAgAGBQJSr82OAAoJEErkyLZmeNiD3nAH/2Q1xFTJrSY2dNvTrIi1S8gc
9i9iH/llWde4Rt/LXReqOf/qU6L/A6yLlWgOa76TZP8nOGlcdZGJFwochCldzICe
V4fNk1V7Vrm0lFf6Xky6Q7/cLawol42CWsQ1rgTi8ly758LtIkMtSGwnyzePdCHL
vx5xIamW6MSl62aUHJJLp4QzqAzKeY4qa2t0Opo07pm/8DKvsMH1NVsnk0vME2cq
1YeGwlwSKuuwWUnA+DZNAumhP7A2n+UTUHq/Gwe8MXdwOohX0qXo2HFb8xt7DMFP
hvKFG3x+6Fy5oZXeKv2RyP+6P1dXd60a9oW+6B3kqnUUZhR5HiLB2pjjwp4BLSU=
=1+hU
-----END PGP SIGNATURE-----
--=-=-=--
