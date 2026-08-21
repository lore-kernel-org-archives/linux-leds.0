Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D75037F00E
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333259; cv=none; b=FKgrQrUTkfUSZGDPR+x2evlm2ccfyxWK2wQhv96dJw4foGYiq9tGBBKfkrfohv+po8bEmpsLphyE81Y3qrFd+0TEtDGdywhU9JNOvf10+S0t6zEBh6rYpyb+8D4hdDcTXgtIVKYeNjEhhoWMRkEuqR7Ud8KnXI37lnFZKcT42PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333259; c=relaxed/simple;
	bh=2H8YN5PsPin4WgmkybeSciLFFRx38Ce1xOLhYaR1IMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P02qvVjebNSI+Foy99/yOnRQPRQKQ33naC/GupKcflCBGbvcyfevt/bciVPyq6PpXVdks2SHFJaqmm73d3HDw99Ig3vUwlkf4cBBzpIN44iuGtTLiUqgTUyW1pw/xD7SjLkW5kfa5X5k7bM0h6emiP2HpjHYdgqBbIEDW1dr7MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OuDdIAWN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OuDdIAWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6021F00A3D;
	Fri, 21 Aug 2026 17:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333258;
	bh=7PLwaqEhXghIMGsYo7yc+KmCXznHx32AT+OTFtaessM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OuDdIAWNeZQDtmU4oq84EMnRVWaArY4TfJsb/9cRzmRU6AL3S+MHACsXKNAVJA6PA
	 X3vthtCnsaFO7beNM0wquBP8O9jDHTJ19fknAZAfV7gtNxOiprLl7OHMKpV2S6G4NU
	 uGiHuQthH3/nlkock1ckaTfXNjNxS+3N0rcx51FYFE/jc3kj+5X/X7Yrgpy7LvCVmY
	 J6WtEAd+NTaSSmZkaPo8VKYQpBvuoCjT7L9i+175EuruWVwQ6mrPXXJFAcu1gHa7We
	 M24g6RmhvZ4sOmV6YxylZIKIC+e814kYcFU+XRg9zFJza3pu48HNeFWPW68Iohn6DO
	 b3jSw97oQDZLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/12] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-7-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-7-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:37 +0000
Message-Id: <20260821172737.EF6021F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sysfs attributes are exposed to user-space before the `trigger_loc=
k` rwsem is initialized, causing uninitialized lock access.
--

--- Patch [7]: [PATCH v5 07/12] leds: trigger: Enforce strict checks in led=
_trigger_is_hw_controlled() ---
commit ebab4e455acab29c44baf2a4a586beae42254bc5
Author: Rong Zhang <i@rong.moe>

leds: trigger: Enforce strict checks in led_trigger_is_hw_controlled()

With all existing triggers adopting the new interface, strict checks
could be enforced to make the semantics of hardware control triggers
clearer.

> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index de17a8bbb4d48..cb49a02a8b3cf 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -42,9 +42,16 @@ static bool __led_trigger_is_hw_controlled(struct led_=
classdev *led_cdev)
>  	if (!led_cdev->trigger)
>  		return false;
> =20
> +	if (!led_cdev->hw_control_trigger ||
> +	    strcmp(led_cdev->hw_control_trigger, led_cdev->trigger->name))
> +		return false;

[Severity: High]
This is a pre-existing issue, but since this patch modifies the hardware
control paths, is it possible to access an uninitialized rw_semaphore here?

In drivers/leds/led-class.c, the device and sysfs attributes are created
and exposed to user-space before the trigger_lock rwsem is initialized:

led_classdev_register_ext() {
        ...
        led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
                                                  led_cdev, led_cdev->group=
s,
                                                  "%s", final_name);
        ...
        init_rwsem(&led_cdev->trigger_lock);
        ...
}

If user-space processes the uevent quickly enough and reads the brightness
attribute, brightness_show() will call led_trigger_is_hw_controlled() before
acquiring the led_access mutex:

brightness_show() {
        if (led_trigger_is_hw_controlled(led_cdev))
                return -ENODATA;

        mutex_lock(&led_cdev->led_access);
        ...
}

Since led_trigger_is_hw_controlled() eventually accesses trigger_lock, will
it attempt to acquire the uninitialized semaphore and cause a crash or
lockdep warning?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D7
