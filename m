Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8532A22FDE6
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691912; cv=none; b=SY3yVQSgbxwoxUciO5dCVnU8MJgfAWhHS8VuVCyB1I/Dsx3g7mNP0ZTbw5vnWkwMGaJ5ev8gzxwWK1m0P4p50kq0gKIPf0uv75RRfObuq3JkbLQG05AGYMM8X4hSTv01reAae4RQaUWajSviQSLFvw06490XBwPLfLkiXVA4NMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691912; c=relaxed/simple;
	bh=yWcAsEf+r4h2QMT6J5vh+hzVupOQXIJRoqcluEzEEVI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A2xSuZTPJC52JWR7p5hxnGzbuMsFvv/+qsz5auZG3zCnTQDqtDyCqTJRgNUhnHaj30Io/XIhlHluGg3YQiV7L9Qr5T1YL2SqIK31KnN6IFmF1Yd5m6k9hboLU5JMB3FdTLefW/ICGaRZ2Yqlq+Hb6178u+XJpHSYvWkDzy7PL/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/hjf1W8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/hjf1W8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31FB1F000E9;
	Sun,  2 Aug 2026 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691911;
	bh=YTEAkVImq9VQcJPP/qPZpXBJLiKcVgsuT8ItUYQM8eg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i/hjf1W8rA5EeWRFPMADiPOm/d9e+PkNuXLeLr7ymOQ4ObBA6Q5I6MzJ8edTU5kL4
	 Q9tJpGMkhrqfKt2VGTb8bBHkhrJTLteeJdmtJjLc1pemJ/VR2iBD4OWv6lD+zwbSur
	 g0VpRRrJXnznFDaoJySkg5NBFcJ5tU+/8WRgXOFQoNUwJ6hBd1I6AgInPJFEILXx/A
	 Mw/pNP+CYBks5/yFzxhC7K2sJ2qYetdOL1Pa/BjjvuQeJKFbAauN4DbOxyHzi9mAZB
	 rDxn8GYIxjKIp4kQXTP8kw2SYFOtyq0AiK9AvV+3LYaBHHjsrkSjv6exkguTR/gSOh
	 yf4dJAcMRGpNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/12] leds: trigger: Do not attach trigger to a
 removing LED
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-8-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-8-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:49 +0000
Message-Id: <20260802173150.F31FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Non-atomic update of `led_cdev->flags` causes a data race that can=
 drop the `LED_UNREGISTERING` flag, undermining the use-after-free fix.
--

--- Patch [8]: [PATCH v4 08/12] leds: trigger: Do not attach trigger to a r=
emoving LED ---
commit dd467951eb46d9ac1296845c072ca12344efe3da
Author: Rong Zhang <i@rong.moe>

leds: trigger: Do not attach trigger to a removing LED

This commit attempts to fix a race condition where a trigger could attach
to an LED during removal. It sets the LED_UNREGISTERING flag earlier in
led_classdev_unregister() and checks it before attaching a trigger.

> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 2460fcf0c4690..4158337896bc7 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -631,6 +631,8 @@ void led_classdev_unregister(struct led_classdev *led=
_cdev)
>  	if (IS_ERR_OR_NULL(led_cdev->dev))
>  		return;
> =20
> +	led_cdev->flags |=3D LED_UNREGISTERING;

[Severity: High]
This is a pre-existing issue, but does relying on a non-atomic update to=20
flags here fail to prevent the race condition?

Because led_cdev->flags is updated non-atomically via a read-modify-write
operation, concurrent modifications to flags can overwrite and drop the
LED_UNREGISTERING bit.

For example, if a user-space thread writes to the LED's trigger sysfs
attribute to remove a trigger concurrently, __led_trigger_set() modifies
the flags locklessly:

drivers/leds/led-triggers.c:__led_trigger_set() {
    ...
    led_cdev->flags &=3D ~LED_INIT_DEFAULT_TRIGGER;
    ...
}

If this overwrites the LED_UNREGISTERING flag, the new early-exit check
introduced in this patch:

drivers/leds/led-triggers.c:__led_trigger_set() {
    if ((led_cdev->flags & LED_UNREGISTERING) && trig)
        return -ENODEV;
...

will falsely pass. This still allows a trigger to attach to the dying LED,
potentially resulting in a use-after-free.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D8
