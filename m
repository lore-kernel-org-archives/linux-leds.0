Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132A733987E
	for <linux-leds@vger.kernel.org>; Mon, 31 Aug 2026 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188301; cv=none; b=aAHXwhv6QVLnAsSv7SaBXunoyb7nypLOFfqtaiDDg539IqoSq0/eljgV3ZeEI2/sjzwkQ1ZWfMNfMb/WAWjsom/pm+IYWZNhAhkpXv1EJryWaapQ5JPj6l6LQ2FUF5tHoBHpoKg5AGL7RWD/B9N/p9DmyrGYmkglTPoevat6hiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188301; c=relaxed/simple;
	bh=v35SYT1NJlyvW7AALIKdiUntTB6Wk95qfYsfPhLCjDM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EMTOvsUL8Dxp1GWSz/XJyGtBu0oNxWUIqxlQM1QB4OhKyNIczopz+fvkwfSA1EJyeO2XadyreD6KMte1IW/oON8mESe33UDDA1SURb8Ut1ZIT4HOQfXtRqqmZDlFL0b4YXjgUlujpwBxfBWM1wFuZOOx+P8VQ3o3fbANEE+fKDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3+bKUUR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3+bKUUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6481F000E9;
	Mon, 31 Aug 2026 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188299;
	bh=3DQbaGhz9/Mo2Em5/R0B6HAcWYztszPxlpw7OKmwn3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j3+bKUUR0+fQNYml4gtr3Swf4ykQbKF2Zk3EAoHTkAs3ie5pn/64ByyesCwKO1Wo2
	 ycoaPfOHSdkrXUvVqi4PWQ07SIIdVWTgc8VHPVudjamRH87vE5qqpJePrkAtRjdP6C
	 aKObC+jKoNag0E8HteuMJVsP9lcrgoanBw8bjzIea67v2Z73+iK/iYxIT5admKQnDT
	 THkPjtr3nbE6B7WVec3hwXxN2d+oiUsxLvM7hkmVgXo0PRmdnTpzX3eJBRupnZ86Lk
	 Kn4L+wFKFvzKCewbkCs04dxv3NfMY/Pdnsf0N+g4KlHipu71V31YtFEHkYe3HD3vQD
	 4PIKhcrZtGDdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] leds: pca9532: Don't stop blinking
 for non-zero brightness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260831133314.4125787-192-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-192-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 14:58:18 +0000
Message-Id: <20260831145819.6F6481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition in N2100_BEEP input device teardown leading to use-=
after-free
--

commit 7c75890ff5fc7d7cfe4c161d927be50be43a1827
Author: Tobias Deiminger <tobias.deiminger@linutronix.de>

leds: pca9532: Don't stop blinking for non-zero brightness

This patch prevents the pca9532 driver from incorrectly stopping hardware
blinking when a non-zero brightness value is set. It adds a guard to return=
=20
early if the LED state is PCA9532_PWM1, aligning the behavior with the=20
LED subsystem documentation.

Link: https://patch.msgid.link/20260331202848.658676-1-tobias.deiminger@lin=
utronix.de

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 0344189bb991c..dae7c67605084 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while looking at this driver,
I noticed a potential use-after-free race during teardown of the N2100_BEEP
input device.

In pca9532_destroy_devices(), the worker is canceled but the managed input
device remains active until devres unwinds:

    case PCA9532_TYPE_N2100_BEEP:
        if (data->idev !=3D NULL) {
            cancel_work_sync(&data->work);
            data->idev =3D NULL;
        }
        break;

If an input event (e.g., SND_BELL) arrives through the evdev node in this
narrow window before devres unwinds, pca9532_event() will blindly queue
up the work again:

    schedule_work(&data->work);

Once devres unwinding completes, the data structure is freed, but the
newly queued work remains active. When pca9532_input_work() executes, it
could access the freed data:

    static void pca9532_input_work(struct work_struct *work)
    {
        ...
        mutex_lock(&data->update_lock);

Could this result in a use-after-free crash if a user space process writes
to the input event node during driver removal? Should the input device be
explicitly unregistered before canceling the work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-192-sashal@kernel.org?part=3D1
