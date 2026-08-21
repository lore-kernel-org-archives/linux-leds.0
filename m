Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ED2381E94
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333261; cv=none; b=Q7ToJOKf6UXdEpW/JfsEOEFkY54C7DTXFBO+j6Xs1zqUSJt1NWLchfXMg3saJWqGyrBh9lUNtVayynXb5Er0YX8J11XJJy9SGRBeubZVx5ciLaUef/EbE/1d12vV97Q8tck8DhRDBmRjPTD4CMtTeUt8UFTS9PvIoGtryv3uFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333261; c=relaxed/simple;
	bh=AZzMPHVbnjJhtmZEWF8c37YXIXzcFtBbst12IO1uhJ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aiF3GbB2YvflqEIgRtbEVPCs6Oi0ig+oPj/BYOv2m9nM2igJ4F97tTvELcbc3Fkhsvohi5mRruji8IdmNsppdbuhLXkOTRcvCEDe0OLOOpxuP1269VOOdZwIF+HcG5OXRRNYiiSVIDvtm5NDmKwYFp1Eku6YlZSTzk9R/yrWNMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A57lT5i2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A57lT5i2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8307E1F000E9;
	Fri, 21 Aug 2026 17:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333259;
	bh=aaSnQsMfJFroGZBIQ16/HimjnIZmSZ2S2ZgrDTPmbCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A57lT5i2JiJVH1FPz+lz8l1iKriXyAvn58Yt7bpQMuVyTtmRX/4Mz7vYlH0LuSi9x
	 88ACAes6SntrWWh8Q0ktcPvGdOTpS0FUk69yu4g5gyYJcQo15zkZV7zpKsAJTEnD1S
	 QB/cMPvf+gZSb7tTXLTWG0xg3Xq5RS5qSSfDYmczTk90TUuWgUJ+G3z+MKiGAG9t59
	 KuWjnoXvaKvulha9kBaoJ+qil30dyQG2K1HanWoQi93fvUZ+7w0So93LYn5ALk0knI
	 3LR2LztXpQ27fl4n0tXwnY2k33uyX4iXcWZtawcJLZG7+RwsBYKGySYng3ZHUHSiDh
	 xja3sIb76+iZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/12] leds: class: Remove hardware control trigger
 when writing brightness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-2-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-2-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:39 +0000
Message-Id: <20260821172739.8307E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Since commit b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of
> hardware controlled LED"), the brightness attribute becomes write-only
> when the LED is controlled fully by the hardware. A write-only attribute
> is very confusing.
>=20
> Moreover, most LED drivers set hardware brightness innocently with the
> side effect of disabling hardware control, but the hardware control
> trigger remains active, resulting in the software and hardware being out
> of sync.
>=20
> Fix it by removing the hardware control trigger when writing the
> brightness attribute.
>=20
> This should also match the semantics of hardware control:
>=20
>     When the LED is in hw control, no software blink is possible and
>     doing so will effectively disable hw control.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D2

