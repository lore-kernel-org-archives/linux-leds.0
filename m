Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99B481FCF;
	Thu, 13 Aug 2026 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630664; cv=none; b=M0LpRvGKsWealmrhETQpzLah+kS8nZHZQLQfOR6xdUoXZAJNbq/9K4AOPC6f3A2kd4FwXSeGYFtX+oXL8qehU0UnUOpKO/QiV4sVWFN55a56j2ydyOxMj/WGepRfB2Zd+zGORc0YeRIdiI4TzsfARspVxEZyf6LQ3Qk/GsmWhlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630664; c=relaxed/simple;
	bh=NeHhTtBUnlX9QKbjYYgjyEIGiNz60R+D+ZRD2gTYwic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WnCLN/FNSFl7r9mtI3yBV01q9hGlz6f5CClOrcKUepKFZJjaxbMIVVkkEiR4X4u47+RBpMTw62iEf8guBWRaK2a12S8PW+acMXVzUC/prHbpUwXFOwBAnZ3ZX7rtQVwYxqaUWz/Bivkg36TcuYHzDXyyHsX41mzE6obel1TrT8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRxTUXru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRxTUXru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A181F00A3A;
	Thu, 13 Aug 2026 14:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630662;
	bh=NeHhTtBUnlX9QKbjYYgjyEIGiNz60R+D+ZRD2gTYwic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eRxTUXrudNsYOq6HKklZ65G9I3/XQDIbWCNyEQP2TpJcOX0Y8Htkq6eBhsffOpmQL
	 iorqky/QrMHUdMYRin31ggFyfM6ry2yt7iei7TqzLXlP/jDotpgePycp9gVppW/qEG
	 UQHdK2NY9SFOfFr7WqqC0skShDbPJcJPP8jplz97b3WpMHjt5Ei6cGZua3rCcWB6fj
	 V1SkgMkfo1kdc23vxTUnCaMGn/n6cxiu7CyTeHWj1fhWoCBq+DE51r8xJfQFWr+lJ0
	 TQ6hhE3sGU/v1ojHqREU8bUVi+SuPhD1Mfh9XK3imK9kaD98TBFYNh1pRT0gkLrhIQ
	 BzkybZRqu9a0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 5/5] ptp: ocp: Add Time Card V9 I2C
 peripheral topology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <1db6580bc69f73f7b0273b0444484b1f391c8616.1786543681.git.ahmadexp@gmail.com>
References: <cover.1786543681.git.ahmadexp@gmail.com>
 <1db6580bc69f73f7b0273b0444484b1f391c8616.1786543681.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:17:42 +0000
Message-Id: <20260813141742.98A181F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Time Card V9 places a BME280 at 0x76, a BNO055 at 0x29, and an
> IS32FL3207 at 0x37 on PCA9546 channel 1.
>=20
> Describe GNSS1 and GNSS2 as RGB LEDs on outputs 0 through 5 and SMA1
> through SMA4 on outputs 6 through 17. The board uses a 4.7 kohm RISET
> resistor, sequential red, green, and blue output wiring, and an 8100 uA
> per-output limit.
>=20
> Select this profile only for the exact fixed-width EEPROM ID
> "TIMECARD-V9". Earlier revisions expose the same I2C devices with
> different LED routing, so probing cannot distinguish them safely. Leave
> erased, malformed, and unknown board IDs unconfigured.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786543681.gi=
t.ahmadexp@gmail.com?part=3D5

