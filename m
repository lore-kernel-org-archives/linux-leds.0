Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC323ED3B4
	for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751122; cv=pass; b=L32n2zmY/fbSnw1MN0WLAD8FCHqhTG9XQ5bMks0pFEj32rWeFhtwesFhniNJc6G9ifc/0f2yMlyMVuCJfiofUxpRenQ54rBs0keemxhUZ1kCa/hEV6PGr+G08JFP+k1ovYeRtbUpWqQ+al4K/gMfHeVIk20cm4Bu7sw2vb4p2Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751122; c=relaxed/simple;
	bh=I6jbNKfZAvp5tvYtV1+kCMvXtvpuuUsJtMHruICNvgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2q73RsGYG+86ddzhydNTYAj/fmfdiYzgfdZirYsBS3WY7pg8eeLRNjpX8YV606VtwO/7CEkFT9W/0tTz8M8YR3nRtPacv7JeX4EuecE8NJMK50BJRKDCRfYBURNF/Mflx28CeFMaINsHsRcAQz51WPxjpsfL3xV1EB1E3e4Zbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTXfSIaL; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTXfSIaL"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2da4eea067so496520166b.3
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2026 23:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790751116; cv=none;
        d=google.com; s=arc-20260327;
        b=jYQ7o+XzyPCGDZckk18WviqCOG8SQ+xgdNb83V6TWl3OdSABJ6tyqXUj6EwokBjEHv
         pIJqpa7Dnq9cH06YPPw9dc/ascfh9UBL2ej7Ll3Jhysts2S/Qb5FbPB5D48TYGCi0KIf
         +MdI1N8/VGtqT7rWkRrbO05rcEFBbFI+d+c49q/BfZqEZFXC0+cE3sFZICBKtvG3XVxH
         oIxa4NsFFtHW0JlQZUlwchhuWPj4Qt3gG1RgSCG+SB7bkSM1I1LgkqzO+GbzPngClP/U
         hVNxP4NfTPluhs5FzMMA55FRyd2WpkBRPuC4JDKJPSbJV+SQd3IeSJ8f9m8rt1F7/8ac
         03NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3jgho2CpwH+56sVlMNdVicCaOg7sOZW/brWJTYh16cs=;
        fh=Gp31NVnT2QiCRl4PfgPzvt/g+v6Cn5sdYaTeSmaU/G4=;
        b=MUqJm74+iCtPN9C6OtB8CRLKzCjy9rSLRXBGC14QwirHHSqhzV0RQScxdGk9JbJgLY
         qJnHEU7+1KcV2dOt+N3y3GKEctFYwjyzEhxwIQV3igmNTkoP4135FIvr5adFwXL/nPYj
         xvR7G9BLTXs+/eUsgd3Y9jrhCfGxTHv2okhB6N+MTFhuzjrpMnlTLlHfoQTibzWh+kRF
         vLJdJFk4hFH+/QX57eSI7YuskxsRX1XQDG02Wbt4EIx86ZpfZpoS05NHlvT6aDxq3Ccf
         j0zTzPIMb2KepZg7+flUKe965X1skvbBM5q75uDUQykTPSJeyD6RYWujaOt8JF/axaCC
         xFtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751116; x=1791355916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3jgho2CpwH+56sVlMNdVicCaOg7sOZW/brWJTYh16cs=;
        b=VTXfSIaLpMyaPvqvMWHVsACDZ2/xvbsutkWV6/YweLx+0+odVccOnEPDeoskVnQQPr
         LO/k8JFd080QVvaGkds/yNJt4kl/dpTWvywY/o59z4auktMCBlN8q0TeQAzOWTFiVWOI
         JYIgjthl+UMDvC9PhtgVXsQ7s3nT13SecQJ8IaVW9OK96/7UpsWaCNPetr5Zw4uX1Puh
         8pjecE1Q+x0wbGTtHMGJj5vDvd2L2mknA0/B353Rmkh+hRK9xIDv2YsIo1P8Hm8Pq1fU
         /tTfGjIi9zrXxAqai8ZSqOxavUlVyD2hfFf0xEZPFDDetMExvfQE8YAR3j2fMndUfK7r
         zMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751116; x=1791355916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3jgho2CpwH+56sVlMNdVicCaOg7sOZW/brWJTYh16cs=;
        b=c+1OiFyvwc7rOUt1J/cOoE30kJXqt6CICKLovryH6RhRjqAqZzFEy5lL/bWA8ATQ9D
         5Dpdbx9P/Ha9ocxGlPlPtliey0Afw4GoKh1YAuy2zIgioBedkcN6/BtZ1VqdcWgNnGDY
         C8nNxrvyn85Tb72PpF9IRkCKpBlUtPUquCia7e6WlBo1IQ/vj3jYG07ZuV+FtT2FYfFA
         QaSVsDeJ3W9ak1gZt0UHjNmBKSxQM0LStJBRiugNesAWN42crsBlepPAu4EPqH27Erq7
         ZmhHROQ0CUYYZCkW54Op+ZjSrfnUvMzT1EBPYuYNGH9d4ZcPN6AQqA3BGfBJkR/CWKl/
         P6wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxli3HSY58VELtA6zFuUn4hoMJhE/aNINiIMcyAp6zNyvxNrn3L2MP1oih3wHW6ddSwQ/UmXjjdM86n@vger.kernel.org
X-Gm-Message-State: AFuF++mCpyDjI8aFRtvEMrpZFvPt2fg0rXXEejX6/cKYbsOOyl5JLw3A
	f1s7yEQy1SNFGlZyLvsp4FEnfVO816skV3V8onnxqonHGAuzRFUM9sb5agZsCaBizClYiv8lv0j
	/bpxkuxG8eZqVxm5IJWEx8wZbB9aoe7kmFubg
X-Gm-Gg: AYBFou0S9pYUQFTfb5zKVUy19YYfhOk3YpGeg/KyOWJVNPQYiwXOX+uzaQNIdxsIHkr
	2lZ4YzoQuKLU8kW41evsVwo1VJX8XC2CZEX/rcX5APaqIiscSyr80g6GXdjZlGSCK2MBYVCq+As
	lJiUBnS7kyrMlk/xTt0Ug4O5ZLLaxoNemL1kbXpcmLz8dmMZGdF7h5uhAEhBgDqyta1PwKD8r53
	BeLswzCb+cYwDQmJtBQZvlJLhnAvZElgQdtexDHyP78pPq5+81PHJTyBw9vndE2diM++GJeSeIo
	VLV83Xqkolx01f3pHFZMxz9AZPkHV17isGQk25o9uWLnJE3CCka/vvP5AivMCOXAXTZUZAzjkqK
	DabuNohabUfgi
X-Received: by 2002:a17:907:7b86:b0:c2d:bf4f:3b75 with SMTP id
 a640c23a62f3a-c2e23d99ba1mr28701166b.31.1790751115995; Tue, 29 Sep 2026
 23:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-leds-input-events-brightness-v1-1-b0ceff3a2343@gmail.com>
 <20260929091141.GD2112133@google.com>
In-Reply-To: <20260929091141.GD2112133@google.com>
From: =?UTF-8?B?0J3QuNC60L7Qu9Cw0Lkg0J/Qu9Cw0YHRgtC40L3QuNC9?= <plaztininikolai@gmail.com>
Date: Wed, 30 Sep 2026 14:51:44 +0800
X-Gm-Features: AclHuK8Vo-obQ9NX3gHnZZTuObnmb52lqPA1EGkVfEGsKUuEMADZIWtyghVj7Qw
Message-ID: <CAEbFrdiD1G8ROr+bv+xrXdFZ175fXvR4588Nu3VjsBxt9RPapA@mail.gmail.com>
Subject: Re: [PATCH] leds: trigger: input-events: Restore previous brightness
 on input
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Hans de Goede <hansg@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Should we be overloading 'blink_brightness' like this?   It would be clea=
ner to
> allocate a small per-LED state struct in the 'activate()' callback, store=
 it in
> 'led_cdev->trigger_data', and free it in a 'deactivate()' callback.

Agreed, I'll keep the saved level in a small per-LED struct allocated in
activate() and freed in deactivate().

> Please avoid accessing 'led_cdevs' and 'trig_list' directly from outside =
the LED
> core.  As you suggested in the commit message, adding a helper in
> 'led-triggers.c' would be much preferred.

Will do: v2 adds led_trigger_walk_leds() to led-triggers.c and the
trigger uses that instead of walking the list itself.

Thanks for the review, v2 to follow.

Nikolay

=D0=B2=D1=82, 29 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:1=
1, Lee Jones <lee@kernel.org>:
>
> On Thu, 24 Sep 2026, Nikolay Plastinin via B4 Relay wrote:
>
> > From: Nikolay Plastinin <plaztininikolai@gmail.com>
> >
> > The trigger turns the LEDs back on with LED_FULL, which the LED core
> > clamps to max_brightness. For keyboard backlights with several levels,
> > such as asus::kbd_backlight, this means the backlight always comes back
> > at maximum after being idle instead of at the level the user picked.
> >
> > Remember the brightness in blink_brightness before turning the LEDs off
> > and use it when turning them back on, as the netdev trigger does.
> > Brightness changes made while the trigger is active are picked up too.
> > This needs per-LED handling, so convert the trigger from the simple
> > trigger API to a regular trigger with an activate callback.
> >
> > Tested on an ASUS ROG Flow X13 GV302XV: with the keyboard backlight at
> > level 1, it now comes back at level 1 after going idle instead of at 3.
> > A level changed with the brightness hotkeys while the trigger is active
> > is restored after the next idle period as well.
> >
> > Assisted-by: Claude Opus 5.5
> > Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>
> > ---
> > This came up while looking at a keyboard backlight idle timeout for ASU=
S
> > laptops in asusctl:
> > https://github.com/OpenGamingCollective/asusctl/issues/98
> >
> > The trigger walks trig->led_cdevs under rcu_read_lock() the same way
> > led_trigger_event() does. I can add a helper in led-triggers.c instead
> > if that is preferred.
> > ---
> >  drivers/leds/trigger/ledtrig-input-events.c | 56 +++++++++++++++++++++=
++++----
> >  1 file changed, 50 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds=
/trigger/ledtrig-input-events.c
> > index d057b2a23..d1ef14ae8 100644
> > --- a/drivers/leds/trigger/ledtrig-input-events.c
> > +++ b/drivers/leds/trigger/ledtrig-input-events.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/leds.h>
> >  #include <linux/module.h>
> >  #include <linux/moduleparam.h>
> > +#include <linux/rculist.h>
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/workqueue.h>
> > @@ -28,7 +29,48 @@ static struct input_events_data {
> >       unsigned long led_off_time;
> >  } input_events_data;
> >
> > -static struct led_trigger *input_events_led_trigger;
> > +static int input_events_activate(struct led_classdev *led_cdev)
> > +{
> > +     struct input_events_data *data =3D &input_events_data;
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&data->lock, flags);
> > +
> > +     if (led_cdev->brightness)
> > +             led_cdev->blink_brightness =3D led_cdev->brightness;
>
> Should we be overloading 'blink_brightness' like this?   It would be clea=
ner to
> allocate a small per-LED state struct in the 'activate()' callback, store=
 it in
> 'led_cdev->trigger_data', and free it in a 'deactivate()' callback.
>
> > +     if (!led_cdev->blink_brightness)
> > +             led_cdev->blink_brightness =3D led_cdev->max_brightness;
> > +
> > +     led_set_brightness(led_cdev, data->led_on ? led_cdev->blink_brigh=
tness : LED_OFF);
> > +
> > +     spin_unlock_irqrestore(&data->lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct led_trigger input_events_led_trigger =3D {
> > +     .name =3D "input-events",
> > +     .activate =3D input_events_activate,
> > +};
> > +
> > +/* Must be called with input_events_data.lock held */
> > +static void input_events_set_leds(bool on)
> > +{
> > +     struct led_classdev *led_cdev;
> > +
> > +     rcu_read_lock();
> > +     list_for_each_entry_rcu(led_cdev, &input_events_led_trigger.led_c=
devs, trig_list) {
>
> Please avoid accessing 'led_cdevs' and 'trig_list' directly from outside =
the LED
> core.  As you suggested in the commit message, adding a helper in
> 'led-triggers.c' would be much preferred.
>
> > +             /*
> > +              * Remember the brightness the LED was last set to, so th=
at it
> > +              * is restored instead of max brightness on the next inpu=
t event.
> > +              */
> > +             if (led_cdev->brightness)
> > +                     led_cdev->blink_brightness =3D led_cdev->brightne=
ss;
> > +
> > +             led_set_brightness(led_cdev, on ? led_cdev->blink_brightn=
ess : LED_OFF);
> > +     }
> > +     rcu_read_unlock();
> > +}
> >
> >  static void led_input_events_work(struct work_struct *work)
> >  {
> > @@ -42,7 +84,7 @@ static void led_input_events_work(struct work_struct =
*work)
> >        * running before a new event pushed led_off_time back.
> >        */
> >       if (time_after_eq(jiffies, data->led_off_time)) {
> > -             led_trigger_event(input_events_led_trigger, LED_OFF);
> > +             input_events_set_leds(false);
> >               data->led_on =3D false;
> >       }
> >
> > @@ -59,7 +101,7 @@ static void input_events_event(struct input_handle *=
handle, unsigned int type,
> >       spin_lock_irqsave(&data->lock, flags);
> >
> >       if (!data->led_on) {
> > -             led_trigger_event(input_events_led_trigger, LED_FULL);
> > +             input_events_set_leds(true);
> >               data->led_on =3D true;
> >       }
> >       data->led_off_time =3D jiffies + led_off_delay;
> > @@ -138,11 +180,13 @@ static int __init input_events_init(void)
> >       INIT_DELAYED_WORK(&input_events_data.work, led_input_events_work)=
;
> >       spin_lock_init(&input_events_data.lock);
> >
> > -     led_trigger_register_simple("input-events", &input_events_led_tri=
gger);
> > +     ret =3D led_trigger_register(&input_events_led_trigger);
> > +     if (ret)
> > +             return ret;
> >
> >       ret =3D input_register_handler(&input_events_handler);
> >       if (ret) {
> > -             led_trigger_unregister_simple(input_events_led_trigger);
> > +             led_trigger_unregister(&input_events_led_trigger);
> >               return ret;
> >       }
> >
> > @@ -153,7 +197,7 @@ static void __exit input_events_exit(void)
> >  {
> >       input_unregister_handler(&input_events_handler);
> >       cancel_delayed_work_sync(&input_events_data.work);
> > -     led_trigger_unregister_simple(input_events_led_trigger);
> > +     led_trigger_unregister(&input_events_led_trigger);
> >  }
> >
> >  module_init(input_events_init);
> >
> > ---
> > base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
> > change-id: 20260924-leds-input-events-brightness-a76ae9a77b85
> >
> > Best regards,
> > --
> > Nikolay Plastinin <plaztininikolai@gmail.com>
> >
> >
>
> --
> Lee Jones
