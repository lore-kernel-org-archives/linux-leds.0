Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586570;
	b=GcjmWFlHf/pEhx8OTXFZYK0sNhPcaruwTcMjGmWQTdfRMl0jP/G9Itu6L3y2rq2I3h84
	 jWLO7Zb2CSB/Y1Qu6q0p6CnjS7DVVKcM31UlyFyKd8VXOIXlLNi/6Y2lWs9iurWxh6gVN
	 n+3li6b4uCcucBIQ4y3CrRYDBPkch2Fsyi17hoPRR6rFItNuGQ3pg1//hWjDQ9JyItc6o
	 sNmMiAg+bWQA5Qmp7JHcX2YXjO4DwVIvXdTDPSdKD/8M9vLxhpl7bBq69u876mTB3ATvk
	 2HECtz0sdPkx6qE8igMTFmJY5sTP+Bl452P3rTRe/mFWMRyQesvV+0QRLp5QOnclW7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586570;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GLamXT9B4XJsJ8c1/rawDFAW5U3Z77puHQzYyBIX8Zw=;
	b=NJE7RXEdCbadFrNqAV6/c+7XSoy6cjZIIhp1rJkGTH46EYYlueLDazdlF59tJGegGf6r
	 l2U/ANuXtz841ORaOcCk6mFF2GpmNJYvj/xir8g29FmQmBiTxWqQKu7D4jE38X7TcpAJU
	 60u+Cj5yUl9dWqzS7Ewo8Yms14r/PnnD82Hru2N/BesKIr1njIWs7BPgOAk7FWcKOWWBY
	 8Md3w26kwMJPAAhQjPbnIvszVtHzTza8w7hEoiEIjIaScY9WsRThXYXlzLA2+hcjGhAaA
	 HEx0Oad2EdHiJIRgDEmSPbNTSZ6X24Y0FudZc3FEpCrFvrvgvKx679mGDxw/qoozlJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exvQjrAR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9393D606A329
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 02:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exvQjrAR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC911F000C1;
	Mon,  2 Nov 2026 02:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586569;
	bh=GLamXT9B4XJsJ8c1/rawDFAW5U3Z77puHQzYyBIX8Zw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exvQjrARWhOrRynhDU84gXtmhbmI6+YQVIsH8ajxuljiujsYGS33jkCPUN/3mQfJp
	 uecTVIEYqA2f78GdgAXOFZ15cGdgiKQFoMKk/tIqO0GB+5QhIsXPm+KN8dT6J/E/67
	 KQwkT4n6ambmp8g+vK4OkydL97c+0MU6cdMAMnlJQkXM3RnbM0kSg3mIfjMxeNGCr4
	 SAsuEaVI60ct5jKXs7HKx8Z7izr6too7XLbXrea8w/mE6Fz4aoJHJSyAdPsaJWore+
	 SSRWztdNxShh28aKF1RILawIDqeQjzq7BrQN9a6d2ks1o0Cn9wu3NbMsg2KpLjfQRu
	 KQqRFx9p8pcPQ==
Message-ID: <sashiko-outbox-192835@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] leds: rgb: ktd202x: Limit the LED current to
 led-max-microamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-8-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-8-eb51eddad08c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:29:28 +0000
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
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D8

