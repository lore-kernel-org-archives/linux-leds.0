Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5E43B5DE9;
	Sun, 16 Aug 2026 23:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924227; cv=none; b=gsiZjbQUnDbr6d9HcZiXcV444MkXadE7/nss2FpdVomxgkCpl2bS9MNQZsvvK3Y+3cTtWpieFVbXTHdkfKweVPnyZBAoNa7zh0MWAmtU6y9J3cl7mcAAjyfxtX9Z5T4JNmMmBHL2DGxeqc62Pe+XrkYuKJFPmvvTblZnMVnw41k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924227; c=relaxed/simple;
	bh=6JAO/u8aEj4x1vHohFGOQr17xTmAwMVHNbyk2uiKc8k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W3V8Zi/ZXqJXsM14XawgByr8CoBVGB5+HGn3n8cPfBGvwevi5CnSPmCrzKNMYIgUfsClfInASQXVu8apJNBNb+Ii6brrjXWXwgRD1UW+juLCcBnn8ml+JlpCuFnkD7zV3LqBFF9cQp6ZM7+eMke/1bR27J/1tZsXKv/w/yauOGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsiOcthU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsiOcthU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCCC1F000E9;
	Sun, 16 Aug 2026 23:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786924226;
	bh=6JAO/u8aEj4x1vHohFGOQr17xTmAwMVHNbyk2uiKc8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FsiOcthUy9AMZGjfzp6zUEgZ7cKrPuQo/srxNcCo85OrMYHcFcR6XzCbZP9u/Mcun
	 NRfAQpFdzEgRh0CEduuQ/LLQtMvFomWH1Dh1PlYIrGu7OptQwzJ0oELwghM6wOQPcw
	 jqhx6OEfml5w0oomYUL/rjX9mPyxsEwjWAUgiKR4ayynVeNzRdd+JeXGKH7VOkQoZU
	 PVaeBIPkSFQMxzS7Atg5WxO3MB4ZR6Xabo0mupdNv4P44SSxPl3wIuLtBgnn4BrV5e
	 07WV8CrKy5y6rhqNvIw0Lbtjz1cidSUN9Pi5QZ3XIiFljAEwpIPG+uACprGnSv3rht
	 oQu6UIdhEuHdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: leds: Document LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260817-upstream-ltc3208-v10-1-e1f9564b1e86@analog.com>
References: <20260817-upstream-ltc3208-v10-0-e1f9564b1e86@analog.com>
 <20260817-upstream-ltc3208-v10-1-e1f9564b1e86@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 23:50:25 +0000
Message-Id: <20260816235025.EBCCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.
>=20
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-upstream-l=
tc3208-v10-0-e1f9564b1e86@analog.com?part=3D1

