Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9375F17745;
	Sat, 15 Aug 2026 23:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786835511; cv=none; b=LBiYBQBHFSOoi7dyCPt1hDuUqmNq3CDJjr33W/+5Nqis8hiWFI3PP/AEg8Vb0BNMAyhJDzppxGjPLZmxiWvK4PdEaGmmUNCoJmlTuubYw8LrFxhzQXFPFb8knUxNh6ZxNPM5wnwRgbK3ouYGVEgju3NCzmo5MK2bTqCiXfA4uPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786835511; c=relaxed/simple;
	bh=+VBWhvR52A/9SfH0/O/VKZ+PqX3IdJQ0KswGlv8/Hrs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KzpalaRZWFlh8l5hoSUvYztlJxPXLn5kkkMzTy7fEPI0+CFLel5RYeBS/8cG/NZGF+w1G26h7GrhG3ck3T7jxJyGoFNUtkUtyWQzkgQIXXONzyUQpERHaMWk2F/uaiZI0WieMl9JcIPazpAAPfsrnwVVCVm2d4sFFWOv0CuAtk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpnQqZoG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpnQqZoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF6A1F000E9;
	Sat, 15 Aug 2026 23:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786835510;
	bh=+VBWhvR52A/9SfH0/O/VKZ+PqX3IdJQ0KswGlv8/Hrs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lpnQqZoGs4m2BeoB5UjC1r19ctbpbxWvJXkq1+pyQ2eCV03XhJxw9zrTJl9S8e9jl
	 SKth0kZ5Q3+e+fqrk4cvZ/kgxdpPn/x/ZUq87woM1BjFq9fvPctT1HoIbDCRb5QFWX
	 Dlr46UzIoOp1SzBpeTbkFjNKX08g+/KPgBuvwR8B9CdCSBcuLZSt8y5L+4KdPxT0Rw
	 kLAIhTrt5D9pqnTCJ4WnmsA5z/20i9iDglkuOwkSnhtiZJAHRuF+uL3DPMze0s4Eat
	 aGNP8zNvKuCIWJ3dRTb+tSd3HgztR4p6L8rJmrLnyRXltyCVNl/lLD0XGoHe8+ZL1u
	 rOfbm3r1Ekbpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 6/7] ptp: ocp: Add R4006 I2C peripheral
 topology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <c6f7d14b58411e4513d5b89472459369edc8de4f.1786747084.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
 <c6f7d14b58411e4513d5b89472459369edc8de4f.1786747084.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:11:49 +0000
Message-Id: <20260815231149.DFF6A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> R4006 boards place sensors and an IS32FL3207 LED controller behind
> a four-channel PCA9546 mux.
>=20
> Describe the LM75B, SHT3x, and ICP10100 sensors and the five RGB LED
> groups. The BNO08x at address 0x4a is omitted because it has no upstream
> driver; the LM75B using the same address is on a different mux channel.
>=20
> Read the board ID independently of the serial EEPROM and select this
> profile from the R4006 prefix. Production IDs may append a board revision,
> while unknown board IDs remain untouched.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786746757.gi=
t.ahmadexp@gmail.com?part=3D6

