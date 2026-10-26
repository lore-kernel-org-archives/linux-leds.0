Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044418;
	b=S9zdqmLWHzIlyln/gLs+Z4aidRda56/1DxsHrpMu1kgiJxm+dsmamqUOevy7vhDVn/nX
	 c7LOsc7jA0g3NFUgwocUpTlfr1J0BfBiV8gp6fSbuTIfde12cXVpOjTwxJpXV2S6QAXD6
	 qIotRsIN1pmXXkZJVcXIbjyCcJJbsWSb6+q1aVoAXDuGezl8CCDlFRPOWcjFjfEHQCCZL
	 nqcKUW8J7U2VRa1qVfciRLv/mGIHe/0g3UTD4XMMvBMK3rDD2vWQRFKQgCe8QFFfu0qxY
	 PFSwvBSgpuOabs/7XGPJ+5GbtwZ/76mv0p0lv4s6fY9K9jyN2atwD2TRcvb9kL3VXdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044418;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sZc3oyDa9tM1iUjorjTT4MIO/1KGVbTVgpph8u+QITE=;
	b=n/R8prfPqPomxOQUdZUei66a2DeGAF28FaoQDGIaWhhGii4oIHm+mu8tB3bdzAH7QWDX
	 YUTevcfM2nzcFsEEgFkhwVngW0oPuj6pEoNRTZ5RPK9BjcSkgx/jEo05VgHWeRKZtH98h
	 6LwbzmCWBkqQ8GQjZpNC6ttfMeZruNUi+BnNlSxTiiBBIKqhVFgX7a86+ZPL1/w5SJkiF
	 jTjci7XA5arIvVnExlDpYQ7RiOKQH9R2Zjovxn2I4XddriFr0Gbyr/fcba6x9dzV5Y8ln
	 tPm42KLDeNnv3RD1ngzQER9I2CzDJNxkm64gCnk9dd2avRp/NFeDsoeeDIpfOrA2ZUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6dODA0x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9139B606A31A
	for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 19:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6dODA0x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB991F01825;
	Mon, 26 Oct 2026 19:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793044418;
	bh=sZc3oyDa9tM1iUjorjTT4MIO/1KGVbTVgpph8u+QITE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f6dODA0xeCWTzQ/Lubu+hgYkdgRQHvs9zJVONLArHCq/2kZqVHYRmEXcZUV96uB5x
	 GJ/4T7fbVWIzFngbb6nq0voEVD5hfAGujpxm+lii+1n9w0XOwD88fa6ASWzGTN30ov
	 od3/mvy3SEPmOsJU8uz0Lrfb7eU+CBA9uuXzEUEOTPKn1Yr6yGgFrVrOWX/9TZJuOO
	 XHXafpf9wOkoXdi4GpDqwk3MSB5AmZtMP//dPJQ36r9t2M29yPWg435srQr6U7Z7EX
	 ctWOdE2SSdPGE+As7SFY+Gu2kvrRoIGzlIT8jY4NYY9lEAKIB6Ok50xrOvS1KodWbF
	 IJKl6cpexLzrg==
Message-ID: <sashiko-outbox-185688@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: Add CZ.NIC Turris 1.x LED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josef Schlehofer" <pepe.schlehofer@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261026195120.12759-2-pepe.schlehofer@gmail.com>
References: <20261026195120.12759-1-pepe.schlehofer@gmail.com>
 <20261026195120.12759-2-pepe.schlehofer@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 19:53:37 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Pali Roh=C3=A1r <pali@kernel.org>
>=20
> Add a binding for the LED controller on the front panel of the CZ.NIC
> Turris 1.x routers. The LEDs are controlled by the firmware of the
> CZ.NIC CPLD, which is memory mapped on the local bus.
>=20
> The turris1x.dts device tree, which is part of the mainline kernel since
> v6.0, already references this compatible string.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> Co-developed-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026195120.1275=
9-1-pepe.schlehofer@gmail.com?part=3D1

