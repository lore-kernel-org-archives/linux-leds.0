Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEF051DAE5
	for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2026 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684376; cv=none; b=FFjX2Kjzvj8RpniEl4deAbuckLKdYRdhsoUNve4ApQNpjh3wQ70FODnWSw0slFX8i9cRbQ/zO3z8gv8WaQaHMy/44CS7cHb2hjgxFmWBLHlYUPyrFabTvmDtUDLWzlCpSE2cMTRtlGj+fzz1XO4mMfA4lyTqdMGlTCOD6AXnNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684376; c=relaxed/simple;
	bh=rCstsIYd6gSOY3dkZBUfy4BJBt6n/gQu4vX/6bcJoA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G6OBiyaYBZSzj7fMfiZ3Zip8mVQM4lvtblFuybVFznwHZ/qC79c1rQfGrEfRd9e5m4zWw4MBErykOoMZWWBGRYgT6W/EV4XIsF/ZmaAX0M1NpJ21DwtxGnx5ZXa31y56TlzLfjlcmSppB2h/5GZNZTjvHsr0XW2nnW1mgK5Z/68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRm0oj1j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRm0oj1j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3661F000FF;
	Tue, 29 Sep 2026 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790684374;
	bh=iPBr238Mk+xgk4cyxZvxcj6M+z/9ZYIjeOMt8Tx7kLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WRm0oj1j95JoM6hs5E3vLV3R/YsBvAUgXSxzCZoAdMh7BZzkIFkPGpVM9FI9b6QWN
	 5f0nghWI6rKkqYGZdoVmk303BDCtv8wW8AL8FkfJ5yBMqUWYSuXdziHOWEc/+paFvl
	 BokvN0D00W9bPv4hm61Y2fMj5CBMBvy8/+F56n9mUqivY7YWYQFysBXSzznF2h5jWK
	 BNnFZBeZ4JnjyTI4uK2PRfz8VYapQjZX+cOzxpt1o0zLoH0FJPMt/SLamSLATxAGkT
	 /42lwBNOs5KU7s6KpeK5cfjZof9Tsh7QDBEjpajrsDxQaQXFoptCHCFw+Ipqm++j69
	 ModhNl50pBkbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] leds: trigger: netdev: Serialize mode/interval
 stores with trigger lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260929120902.2793138-5-alexander.sverdlin@siemens.com>
References: <20260929120902.2793138-1-alexander.sverdlin@siemens.com>
 <20260929120902.2793138-5-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 12:19:34 +0000
Message-Id: <20260929121934.AF3661F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] leds: netdev: async work cancel allows zombie worker to overwrit=
e hw offload
--

commit d51dca8c4abbb112c1f8e31383d3f2334d50c585
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>

leds: trigger: netdev: Serialize mode/interval stores with trigger lock

This commit adds explicit mutex locking to serialize mode and interval stor=
es.
It replaces the synchronous delayed work cancellation with an asynchronous
cancellation while holding the trigger lock.

> diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger=
/ledtrig-netdev.c
> index b27a453bbb859..7ad61c4be282e 100644
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
[ ... ]
> @@ -424,6 +424,10 @@ static ssize_t netdev_led_attr_store(struct device *=
dev, const char *buf,
>  		return -EINVAL;
>  	}
> =20
> +	/* async cancel: the worker takes this lock */
> +	mutex_lock(&trigger_data->lock);
> +
> +	mode =3D trigger_data->mode;
>  	assign_bit(bit, &mode, state);
> =20
>  	if (test_bit(TRIGGER_NETDEV_LINK, &mode) &&
> @@ -436,20 +440,26 @@ static ssize_t netdev_led_attr_store(struct device =
*dev, const char *buf,
>  	     test_bit(TRIGGER_NETDEV_LINK_25000, &mode) ||
>  	     test_bit(TRIGGER_NETDEV_LINK_40000, &mode) ||
>  	     test_bit(TRIGGER_NETDEV_LINK_50000, &mode) ||
> -	     test_bit(TRIGGER_NETDEV_LINK_100000, &mode)))
> +	     test_bit(TRIGGER_NETDEV_LINK_100000, &mode))) {
> +		mutex_unlock(&trigger_data->lock);
>  		return -EINVAL;
> +	}
> =20
> -	cancel_delayed_work_sync(&trigger_data->work);
> +	cancel_delayed_work(&trigger_data->work);

[Severity: Medium]
If the worker netdev_trig_work() is concurrently executing and blocked on
trigger_data->lock, will this asynchronous cancel fail to stop it?

Once netdev_led_attr_store() finishes configuring hardware offload and
releases the lock, could the worker unblock and continue to execute?

If it does, the worker doesn't appear to check trigger_data->hw_control
before falling back to software blinking and rescheduling itself:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_work() {
	...
	/* If we are not looking for RX/TX then return  */
	if (!test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) &&
	    !test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) &&
	    !test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) &&
	    !test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode)) {
		mutex_unlock(&trigger_data->lock);
		return;
	}
	...
	/* no check for hw_control */
	...
		led_blink_set_oneshot(trigger_data->led_cdev, ...);
		trigger_data->last_activity =3D new_activity;
	}

	schedule_delayed_work(&trigger_data->work, ...);

	mutex_unlock(&trigger_data->lock);
}

Will this cause the zombie worker to permanently overwrite the hardware
offload state configured here and waste CPU by continuously rescheduling
itself?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929120902.2793=
138-1-alexander.sverdlin@siemens.com?part=3D4
