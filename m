Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290814F7CAE
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073340; cv=none; b=UtVfcFx/BsMcHcB0XXSFov82e0WmsRm329i2vKWEVRGWFdTbLWZjDey+4+ON9XNmBJel14GJ8Dx5kZo1M8qzHObG5JCXsQPKJdPL/uoAiCws/wTHzDee1LgSohKpe3Z2kbHv8mNxrrpGhSowW/DUpxDON3ZNOH4Q/o170pOHHb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073340; c=relaxed/simple;
	bh=oiRHwgICGxMddhXXBS/KfLLPlNZGUQTQVlBHcvlA7sU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=T69wkfFdmHjfm/YRlWTvUkZha6VB8lQy8Ynr2m9v2XTd/fPmA8orGjt1MHl8FsyF1KUeBwUGwaGWXe9jAfuFHoQt5SF4Sk6uErBjyo/qqWJCqJstDy+bQ2PBnXkBUwVYV9HKdRg+gw6PKls7avjsCWVCqQm6dpzaaWvyZAYLh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPlhHs82; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPlhHs82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B44A1F000C4;
	Thu, 15 Oct 2026 14:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792073338;
	bh=oiRHwgICGxMddhXXBS/KfLLPlNZGUQTQVlBHcvlA7sU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CPlhHs82TUKWVSvBoqZ895kre9bxHe+m7tGDCknGngwGfm0iUoWuDEE5xLZ2aRIM6
	 pPbAvIzrFXKd/L6RQlqso4S39EI62P1a91azZYufYvPZMMPh5sS84chJQac/cA6Hta
	 5jkLfy3BbGOiVxTOIRM5mnQw2mDqygbWSVtJRQdXEXPoACwplwN4TDPqjA3IrSSG2s
	 9dCrBRpmvnTPDiq3D7WEYFaYyLj4t3xhmnZt1gmZtMUSZuJBYCB+zJoZEW3f+ry4C/
	 ZxcRyareTNUCbSBYo7LXC7gh9v0hz31nl8wDzyHv/Zg1d28/Els5KJViKcUrJxVp7h
	 lZQ9WkiFNa6Gw==
Message-ID: <sashiko-outbox-172950@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC v10 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liang Haowen" <nbg2974@gmail.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261015140051.1159817-2-nbg2974@gmail.com>
References: <20261015140051.1159817-1-nbg2974@gmail.com>
 <20261015140051.1159817-2-nbg2974@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 14:08:58 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> ASUS ROG external NVMe enclosures (ROG STRIX Arion, USB 0b05:1932) are
> plain USB mass-storage devices with no HID interface: the Aura LEDs
> hang off an ENE controller driven by vendor SCSI commands on the same
> LUN as the disk. The enclosure has 4 independently addressable LEDs,
> verified on hardware.
>=20
> Register a scsi_device_handler matched by INQUIRY (vendor "ROG",
> model "ESD-S1C"); it does not claim the sdev (sd keeps owning the
> disk) and exposes each LED as a multicolor LED class device,
> /sys/class/leds/asus-arion-0-0-0-0::led-0 through led-3. The
> H:C:T:L part of the sdev name keeps the names unique when more than
> one enclosure is connected, with its colons flattened to dashes. The
> color section stays empty, since multicolor LEDs enumerate their
> palette via multi_intensity, and the four identical zones use the
> function name with a "-N" ordinal, as the naming section in
> [ ... ]
> cannot wear the flash with a pointless SAVE, and the lock keeps a
> colour write from being reordered after its pending flag on weakly
> ordered architectures.
>=20
> Signed-off-by: Liang Haowen <nbg2974@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015140051.1159=
817-2-nbg2974@gmail.com?part=3D1

