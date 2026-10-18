Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10324B99BE
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792332690; cv=none; b=I8TTA2Zh5Cr3x8fK+fqEr/Y4YXzf9crJ5nMeRdHrn65YPw9WXm8ALpatW9l8eOiH3j/Cwjl4cZsNiNRF52Jc7zlQBWDRoa3hg618gsASMl37sBxtzT4srOfNJ2RhzTAN8gwSY8hd+0UrrfCyolybfOMcTE5/2XXwIIDUXfw93XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792332690; c=relaxed/simple;
	bh=xFWV9w8VXVujtDGN3qUY8pKlXdTAZjaG8z9Ypnuff08=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fa+lSRlpL8HYSpJ9ed4hkxKFzDTFDh1jKVeIUbkYk/j5X2Rc/wQRRWnBGfLMRY9553EDKhjPseKQFK7N6ip66qbJkCQTToZzyfN3ivQGCBkdvSZSzG5QpU0/Zkl5MouMpRMW5PUYnH4/a5SWdLOEFakg6y12tcfa9KN06Q6lzbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6jq0/e1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6jq0/e1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557661F000CD;
	Sun, 18 Oct 2026 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792332689;
	bh=xFWV9w8VXVujtDGN3qUY8pKlXdTAZjaG8z9Ypnuff08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E6jq0/e1St9BZBNN4uyyKV6z1FBO/iiNKEDrbfGclARroRcqXlZ3BIYoPdoi5oBxo
	 Zd0eptSV5ytkBRCSfrLe9/7vQ8jX7/bVvMuI7FQB3PmrDvGaV7SOFN++uw6YTLJbPU
	 sFHUmWolu38UJiCnRx+/+VbcPJCTEwSaPgnmgLYD0TisHpEFkY4ehWR/CBGhmaywZE
	 uL78zdqpVD4+d2dgkaDIoHLdvEOxhbOthQlZoCtxRhvFCLKXpOoDn9Pg1Sd/0/lN5w
	 MDR84PG9SjMGLyMZQE8fBDh3+Pk80IkfZZKP/wJjWIpql5HPosESFeP7BqFHEQ0ec6
	 KnmLsGmswLV/w==
Message-ID: <sashiko-outbox-176188@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] leds: class: Use correct type for
 brightness_hw_changed field
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-8-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-8-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 14:11:28 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Device drivers can supply a unsigned integer using
> led_classdev_notify_brightness_hw_changed(), but the associated
> field can only store signed integers, leading to issues for very
> large brightness values.
>=20
> Fix this by using the correct type for the brightness_hw_changed
> field.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D7

