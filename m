Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251548;
	b=WvjYVqhn2zkKm3rIhc/5Lwc1WEXLAjsqllFKMz9eIhqSc25eiE1rgoSTxeqVcDBKOio8
	 zZU5MG8/9jl9jf35tgD94iHgODmm6hHEq2hdwbTTfCY10WZQLT76RYK1mPrrOYMHFiGmv
	 LJG3z0FBryGsAf9zUElFv1kQ50CF7lRZN4DjUIti03yT8fIF72wmnjlbWueuKKAU86GI4
	 ruEOaDJ2nymJU/gkO6bSPEGtsDTiiZwDCRlovKH5nUmmRzvWuGsvgvx2YR3075Hl/k+sP
	 l470Aluur2dPu18MUvlCCyXpuMG/7Qwdki6Hh5gAGwkn3FLvgIVPseqI2Kg03uKk+SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251548;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BgPCHhf5FXvRtDw3jklepVu+koBvXNOd54lIXK1ad/Q=;
	b=LG450wD7dbZlwbPbG6eoe9XMFQ2E2p5VjMqY1n7GHzJbR2498SS3KlvqCsALZP/Ugf7V
	 lWWxFd2APiCtMyNmGfP7lFeaXAFh4xcHspu5gZLrv8MFI9bw4GDUvyDLfzQxsxQjlMsKK
	 O+k+GyPAvoVqHH03M/WUJzhBEwvw0p9gbOnfJzMm/kxJqPv6NqBQCmjjvt5i9sUnEAuQl
	 kQpYp3qNO6HJltdoILoLQNjCqakfsB6jGqtYenk4GKWc4HkQeK5cUx3eTiE+09IpTPrLb
	 SptTJxj2hK+kOEKwcnvHzN5mndVGgvBFD96oDtMF6sSrZ+hpOZedFV+CyRr9RaxiA4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENnxNi23;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46B9606A326
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENnxNi23
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C711F008A2;
	Mon,  9 Nov 2026 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251548;
	bh=BgPCHhf5FXvRtDw3jklepVu+koBvXNOd54lIXK1ad/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ENnxNi23LjRlaiOOyginbXAtMQfK8eQpCKzlP/VZb+2DWgZivm+UwG+7H48Fog8do
	 yuA0JZsnnUpiQKjjmdqLLDFitFeTZ3pu3gFw4hduVUtpShX71dFbP2HJ1cjs1pY0rx
	 a64n/7l0CcpogerIhdb652Ywa2J0/X9BdX28cvffldedGkbBn6331z0XQ8kni667X+
	 sz/dzvgtbm6ePOOtNcpOH7SJ36n8HN8BJWuOCnvQlDR9LoONCyGVa3Rz3iaKPFYRiq
	 w7jzT2E7hoOF9oGWkumqtZEU8h8YqbeIAnNqQkW+Xlo2s9jpuB3BdiVIXe+llnuSHG
	 dRaBZblv5ZFjA==
Message-ID: <sashiko-outbox-205466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/11] leds: rgb: ktd202x: Limit the LED current to
 led-max-microamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-9-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-9-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:12:27 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The full brightness of 192 is 24 mA, which is more than many indicator
> LEDs are made for, and a channel may drive several LEDs in parallel. The
> GL.iNet GL-SFT1200 firmware, for example, runs each of its two channels,
> three LEDs each, at 1.375 mA.
>=20
> Honor the common led-max-microamp property for single color LEDs by
> lowering max_brightness, since each brightness step adds 0.125 mA. Set
> max_brightness before the LED is registered, and blink at max_brightness
> rather than at the chip maximum.
>=20
> Multicolor LEDs are left as they are: the LED core already bounds each
> color intensity, and the hardware this was tested on has none.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D9

