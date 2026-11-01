Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793518009;
	b=tFz5j2DGR/mpyQXZUMp5bJR5uRerqW4/OaUynp1RLYFEvh6lM6ptXErMrWwWc7e1pm58
	 B6KhLfgZVgLOPEkpSqs/+HlXqBePdNJt9anJXy/yMcFgjlffE7LjcOeMJRDbygmqP3A+h
	 UuJaoe/pTo5ou2Mzbj/AeqEGWHFzlH1lopjxDMupRzzwCmhl/JCE3D3vEywG9+Xvrdqxg
	 EsyrjrX2W0BxPa+Xb772KUncxmmpY53tiaEeqzPY2VqZYXsi0OC3TnUIdBF6/xmjUX+bi
	 CKm7kY5AUN0Gc5i18H3BnCNlHVGb5Vur1WOrkF9792+lV4cCPvUd7HsAXzZfxn9t5dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793518009;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/cc98Hkv+KV3NsMJkhr5/6zZ9GiywINLmdsQB/JaUBw=;
	b=Z+e9/S531hbPhGLZbi0jo7oCByLqIE5pFYqrBaK/3tDko3EFGioECOuHHSKGrIEmLX5m
	 tlZ+xlDVAfPgBfA/lh/kUTUwADU5iX6d46suoGexB5yPY761x9gUYtFCHEV+SIZfynLqz
	 H0aqKIPFj5EAOFgNmFhlEDu42vjwHT/ft6uo+pvP3RyiQgMlL1QLFZd8LOudSgtdM2cnz
	 ytx7c6TqCpCIVHNPw/0Sp+lw/MNYulnZmBXfg5//e1/25HrqLOxy87qV4PPrM7B5Xpa8Z
	 IFPEeMXVrYDQhE0raaHqWL0aV+sVN15CvMLc1Mo5z6DTTvnZKUDwW5V1T3ZpTGRyDrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KISfdQln;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAC9606A324
	for <linux-leds@vger.kernel.org>; Sun,  1 Nov 2026 07:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KISfdQln
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3091F000C1;
	Sun,  1 Nov 2026 07:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793518008;
	bh=/cc98Hkv+KV3NsMJkhr5/6zZ9GiywINLmdsQB/JaUBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KISfdQlnq1mvK7ucFBcEiXNtt/sduaOS+T3bKTxzzJu9KZHuNfqMENysMV3bNdik/
	 P3gWIVCnlkqYJCLefuoH6nUtofglCKa2ua8W9l9/C9I+KZAseoktVeLCq3LWG6Dajt
	 csF8FQEO0wUREYM94UrDDSHv4XHUTkbhiBiM0OnEllfBKcgEBCqsEfPjJy6M7DpnlL
	 rGeLqDksS5CGC53kN+gBaHmd8pdtvi1FsVYl7qHgWer7qpMAYfTu3sdr+5Egg0jpaT
	 h6uUFhxN8mADxYwOHPsYyBTRv/i1K2VLNiCI7KDO7lPd2zf5bgl2kfmV1VpnNPO/wz
	 yg3MiZ1Sa/7Yg==
Message-ID: <sashiko-outbox-192307@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] leds: trigger: input-events: Restore previous
 brightness on input
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolay Plastinin" <plaztininikolai@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-leds-input-events-brightness-v5-1-d5296b1957dc@gmail.com>
References: <20261101-leds-input-events-brightness-v5-1-d5296b1957dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 07:26:47 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] leds: trigger: input-events: direct traversal of internal led_cd=
evs list
--

commit 72651dfe13f897594e567a9427807c1d263125a5
Author: Nikolay Plastinin <plaztininikolai@gmail.com>

leds: trigger: input-events: Restore previous brightness on input

This commit converts the input-events LED trigger from a simple trigger to a
regular trigger that saves each LED's brightness before turning it off on i=
dle
and restores that brightness on the next input event.

> diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/t=
rigger/ledtrig-input-events.c
> index d057b2a239672..5fbd3e85399f4 100644
> --- a/drivers/leds/trigger/ledtrig-input-events.c
> +++ b/drivers/leds/trigger/ledtrig-input-events.c
[ ... ]
> @@ -28,7 +29,70 @@ static struct input_events_data {
>  	unsigned long led_off_time;
>  } input_events_data;
> =20
> -static struct led_trigger *input_events_led_trigger;
[ ... ]
> +/* Must be called with input_events_data.lock held */
> +static void input_events_set_leds(bool on)
> +{
> +	struct led_classdev *led_cdev;
> +
> +	guard(rcu)();
> +	list_for_each_entry_rcu(led_cdev, &input_events_led_trigger.led_cdevs,
> +				trig_list) {
> +		struct input_events_led *led =3D led_get_trigger_data(led_cdev);
> +
> +		/* Not yet activated, or already deactivated during error unwind */
> +		if (!led)
> +			continue;

[Severity: Medium]
As reported by Lee Jones on v1 [1], should drivers/leds/trigger/ledtrig-inp=
ut-events.c
avoid accessing led_cdevs and trig_list directly from outside the LED core?

In include/linux/leds.h, struct led_trigger defines led_cdevs as the list
managed by the LED core for simple triggers:

include/linux/leds.h:
struct led_trigger {
	...
	/* LEDs under control by this trigger (for simple triggers) */
	spinlock_t	  leddev_list_lock;
	struct list_head  led_cdevs;
};

Because led_trigger_set() in drivers/leds/led-triggers.c links
led_cdev->trig_list into trig->led_cdevs before calling trig->activate() and
unlinks it after calling trig->deactivate() on the device_add_groups() error
path, walking input_events_led_trigger.led_cdevs directly in
input_events_set_leds() exposes partially activated or already deactivated
LEDs to the trigger driver, requiring input_events_set_leds() and
input_events_deactivate() to work around LED core list ordering.

Would it be cleaner to either provide a helper in drivers/leds/led-triggers=
.c
as requested on v1, or maintain a driver-internal list of struct
input_events_led instances (similar to other non-simple triggers such as
drivers/leds/trigger/ledtrig-backlight.c)?

[1] https://lore.kernel.org/r/20260929091141.GD2112133@google.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-leds-input=
-events-brightness-v5-1-d5296b1957dc@gmail.com?part=3D1
