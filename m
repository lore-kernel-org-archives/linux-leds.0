From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/1] leds: blinkm: Remove unused variable
Date: Mon, 14 Jul 2014 17:54:59 -0700
Message-ID: <CAK5ve-K5sjHFjApF3+3kGBr6F+sfchhVTRaBjyBhSLYpVE8j0A@mail.gmail.com>
References: <1404216443-21177-1-git-send-email-sachin.kamat@samsung.com>
 <CAK5ve-KYwnDuB0YooOo7zsZ_EH8VuJ_9ex_919CDEtJqiNrp=g@mail.gmail.com>
 <3261853.AEHXRXfVcs@samweis.auenland.lan> <3676295.nUINk5lfjs@aragorn>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:57740 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754542AbaGOAzV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 14 Jul 2014 20:55:21 -0400
Received: by mail-la0-f54.google.com with SMTP id el20so879672lab.27
        for <linux-leds@vger.kernel.org>; Mon, 14 Jul 2014 17:55:20 -0700 (PDT)
In-Reply-To: <3676295.nUINk5lfjs@aragorn>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Sachin Kamat <spk.linux@gmail.com>

On Wed, Jul 9, 2014 at 5:34 AM, Jan-Simon M=C3=B6ller <dl9pf@gmx.de> wr=
ote:
> What about this ...
>
>

Could you post the patch directly here? and please fix those C++ style =
comments.

-Bryan


> --
>
> Dipl.-Ing.
> Jan-Simon M=C3=B6ller
>
> jansimon.moeller@gmx.de
> Am Dienstag, 1. Juli 2014, 23:50:29 schrieb Jan-Simon M=C3=B6ller:
>> Nighttime here. I'll look tomorrow.
>>
>> > On Tue, Jul 1, 2014 at 5:07 AM, Sachin Kamat <sachin.kamat@samsung=
=2Ecom>
>>
>> wrote:
>> > > 'ret' is not used in the function. Remove it.
>> >
>> > Removing it is easy but I guess we should check the return error s=
tatus
>> > here. Jan-Simon, what's your opinion then?
>> >
>> > Thanks,
>> > -Bryan
>> >
>> > > Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>> > > ---
>> > >
>> > >  drivers/leds/leds-blinkm.c |    8 +++-----
>> > >  1 file changed, 3 insertions(+), 5 deletions(-)
>> > >
>> > > diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blin=
km.c
>> > > index d0452b099aee..f07f920ac0ac 100644
>> > > --- a/drivers/leds/leds-blinkm.c
>> > > +++ b/drivers/leds/leds-blinkm.c
>> > > @@ -441,14 +441,13 @@ static int blinkm_transfer_hw(struct i2c_c=
lient
>> > > *client, int cmd)>
>> > >
>> > >  static void led_work(struct work_struct *work)
>> > >  {
>> > >
>> > > -       int ret;
>> > >
>> > >         struct blinkm_led *led;
>> > >         struct blinkm_data *data;
>> > >         struct blinkm_work *blm_work =3D work_to_blmwork(work);
>> > >
>> > >         led =3D blm_work->blinkm_led;
>> > >         data =3D i2c_get_clientdata(led->i2c_client);
>> > >
>> > > -       ret =3D blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
>> > > +       blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
>> > >
>> > >         atomic_dec(&led->active);
>> > >         dev_dbg(&led->i2c_client->dev,
>> > >
>> > >                         "# DONE # next_red =3D %d, next_green =3D=
 %d,"
>> > >
>> > > @@ -546,9 +545,8 @@ static void blinkm_led_blue_set(struct led_c=
lassdev
>> > > *led_cdev,>
>> > >
>> > >  static void blinkm_init_hw(struct i2c_client *client)
>> > >  {
>> > >
>> > > -       int ret;
>> > > -       ret =3D blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
>> > > -       ret =3D blinkm_transfer_hw(client, BLM_GO_RGB);
>> > > +       blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
>> > > +       blinkm_transfer_hw(client, BLM_GO_RGB);
>> > >
>> > >  }
>> > >
>> > >  static int blinkm_test_run(struct i2c_client *client)
>> > >
>> > > --
>> > > 1.7.9.5
