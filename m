Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501148;
	b=dy9IltuQXzMvg30CSs9eBkSfj/reoN1DDecs7Zoiefw9/vwemcWdnFoJRGpgsTq65dAw
	 /PtaTGnqAP/2ilOx87a4hCyuRigvQg5ya+gs59US+BX1euHwSxdHhdJGyTvBzcB9CbBK+
	 2Mj9u5IVfuTL1D4e6PN0C4jWMW/D6XW8r0faeUl6R1jjMg1PZf5Of/4zhCAkTVzdDe1jB
	 kP4hiw5r3/0eT0EMX756rX6qcsd97P3DHC9k8+HfYRFRs9BIRCi4ZzjO6e4vWGXf1Eocn
	 mSV3mX6nn/Oloc4WR6TlZfv0taf89zAxgSjggwF9VvKGmjfc1BOZPVszQypRThBV3ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501148;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yCRMTjRp7KnGZFSOy7SlGCsfS32+WsKfWYpdsBeVsng=;
	b=VxOFTyIt7Gi13FeKUHTBS7tJN4AlmbMPtHq4FH1L8vA1cvFiaxMpDRYOIJmDYqGwlJN7
	 c4kr2VNmGDDa7ezlraJz1LoWwxXq7TUeRdYTft78kYUZzAPOtXyxfBQf0SGKA27lcSMKR
	 5Mi+LfPyiInjek5icNdZE+vPRj1Gs9LBn8jsTN8A/sK7RSUks3PfYouXOGDsZOZhYw77A
	 kFtej7DhOnENv/1Il4gyMwsNVb2J1ktUV84HgEQZ7exTdDavKOo2UmHh4MyzxknpI2uJs
	 mKJJ/Dz7Vh6KXwxQTagHhcGptcs7nVqJ6UH0RRwO97r6KRkVfESfLTSMUtoGq8j1Wkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPcLvyuz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A38E606A31A
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPcLvyuz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980E81F000C4;
	Tue, 20 Oct 2026 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501147;
	bh=yCRMTjRp7KnGZFSOy7SlGCsfS32+WsKfWYpdsBeVsng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LPcLvyuz3vrlcyJ7g63SFOM/SXIzF3FGqwMoQCwu1zv316Oxu0jUScyP0wIql1xYM
	 TEiHbVjkTZ6IG5q3IXCkDOQwDpzA25AnoCWK2Yz4Yhu2T2NuAlUX6S+Z9/CXHC1d6U
	 fjL2+ze+wE7qcqrLmt/Yfs/paoMmGrQ+8/MHR00JkRkgChRzY/7umupbBreomQ1yjR
	 H01iev9Q3SB+MAjp/mzdfxy3IodURVCimlDZ7JmpKnLAKdyK+vVwfi/GTsVaagnB8v
	 75kDYx1fsXB6GcjdeiuzjUzPyaWdR66UVCQZdQfqbEESHGbLiAaytjZGdmh+eKaeS4
	 jxUVG0+9duBNQ==
Message-ID: <sashiko-outbox-178980@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] leds: trigger: netdev: Serialize mode/interval
 stores with trigger lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261020124651.1987272-5-alexander.sverdlin@siemens.com>
References: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
 <20261020124651.1987272-5-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 12:59:07 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] leds: trigger: netdev: unlocked hw_control check in interval_sto=
re()
- [Medium] leds: trigger: netdev: missing carrier_link_up check in netdev_t=
rig_sw_blink()
--

commit fa618832fa8e967d013f87c080cded7d0b155827
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>

leds: trigger: netdev: Serialize mode/interval stores with trigger lock

This commit serializes sysfs mode and interval attribute stores in the
netdev LED trigger using trigger_data->lock, switches to asynchronous
work cancellation to avoid deadlocking with netdev_trig_work(), and adds
a netdev_trig_sw_blink() helper to gate software activity polling.

> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index bf9a5ec245a43..6859783422f5d 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -81,6 +81,16 @@ struct led_netdev_data {
> =20
>  static const struct attribute_group netdev_trig_link_speed_attrs_group;
> =20
> +/* True while the software activity worker should keep polling and blink=
ing. */
> +static bool netdev_trig_sw_blink(struct led_netdev_data *trigger_data)
> +{
> +	return trigger_data->net_dev && !trigger_data->hw_control &&
> +	       (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
> +		test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
> +		test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
> +		test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode));
> +}

[Severity: Medium]
Should netdev_trig_sw_blink() also check trigger_data->carrier_link_up?

In set_baseline_state(), trigger_data->work is only scheduled when
trigger_data->carrier_link_up is true, and it is not cancelled when
carrier_link_up is false:

drivers/leds/trigger/ledtrig-netdev.c:set_baseline_state() {
	if (!trigger_data->carrier_link_up) {
		led_set_brightness(led_cdev, LED_OFF);
	} else {
		...
		if (netdev_trig_sw_blink(trigger_data))
			schedule_delayed_work(&trigger_data->work, 0);
	}
}

Both netdev_trig_notify() and set_device_name() call
cancel_delayed_work_sync(&trigger_data->work) before acquiring
trigger_data->lock:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_notify() {
	cancel_delayed_work_sync(&trigger_data->work);

	mutex_lock(&trigger_data->lock);

	trigger_data->carrier_link_up =3D false;
	...
	set_baseline_state(trigger_data);

	mutex_unlock(&trigger_data->lock);
}

If a concurrent netdev_led_attr_store() or interval_store() acquires
trigger_data->lock in the window between cancel_delayed_work_sync() and
mutex_lock(&trigger_data->lock) while carrier_link_up is still true,
set_baseline_state() will re-arm trigger_data->work.

When netdev_trig_notify() or set_device_name() then acquires
trigger_data->lock, it sets carrier_link_up =3D false and sets the LED to
LED_OFF without cancelling the newly scheduled work. When netdev_trig_work()
runs, netdev_trig_sw_blink() returns true despite carrier_link_up being
false, allowing the worker to keep polling, blinking via
led_blink_set_oneshot(), and rescheduling itself while the link is down
(and leaving the LED on when any link or duplex mode bit sets invert =3D 1).

[ ... ]

> @@ -503,10 +520,14 @@ static ssize_t interval_store(struct device *dev,
> =20
>  	/* impose some basic bounds on the timer interval */
>  	if (value >=3D 5 && value <=3D 10000) {
> -		cancel_delayed_work_sync(&trigger_data->work);
> +		mutex_lock(&trigger_data->lock);
> +
> +		cancel_delayed_work(&trigger_data->work);
> =20
>  		atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
>  		set_baseline_state(trigger_data);	/* resets timer */
> +
> +		mutex_unlock(&trigger_data->lock);
>  	}
> =20
>  	return size;

[Severity: Medium]
Can interval_store() race with concurrent trigger_data->hw_control updates?

At the start of interval_store(), trigger_data->hw_control is checked
before acquiring trigger_data->lock:

drivers/leds/trigger/ledtrig-netdev.c:interval_store() {
	if (trigger_data->hw_control)
		return -EINVAL;
	...
	if (value >=3D 5 && value <=3D 10000) {
		mutex_lock(&trigger_data->lock);
}

If trigger_data->hw_control is false during that unlocked check, a
concurrent netdev_led_attr_store() or netdev_trig_notify() (on NETDEV_UP)
can acquire trigger_data->lock first, see the default interval in
can_hw_control(), and set trigger_data->hw_control =3D true.

When interval_store() then acquires trigger_data->lock, it does not
re-check trigger_data->hw_control before updating trigger_data->interval
and calling set_baseline_state(). Doesn't this allow trigger_data->interval
to be changed to a non-default value while hw_control is active, causing
subsequent can_hw_control() checks to unexpectedly drop out of hardware
offload?

[ ... ]

>
> base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020124651.1987=
272-1-alexander.sverdlin@siemens.com?part=3D4
