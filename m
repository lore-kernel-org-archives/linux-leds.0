Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7883A5E7A;
	Fri, 24 Jul 2026 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879751; cv=none; b=XpWwWlOXy/Gqd9IsA8/zU5Ay6LqAtH8oGbE1S+r0jXSzzvwLTJmEJlhEyMw0d+FaWWkPpZwmnFv/mrcbXTl/nYoQCmvG9NZ2u+CMmTVrv8xj0rGjdfyTGVxop+U7kpdhBJkRyrM7podySojtHK1KRMDNEDEoEcAiKEKmWfnHRQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879751; c=relaxed/simple;
	bh=Dqp12DSYGeWQKJorlJDC7EV+WSWYgY+HK/c12t/h69E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gfQpYmLYhRLci95F1TM3SyU9rr71YVELQVrQhDFaytG0clMGI7ahTPIq6ziCw/MP1Rhu61svARXzMRX++/e69rN2Di9lUE49uPKztR5xC2gxfENx+g/KVnNOHj1MHqQ32bghHYUaIJZwEmc/5+Y8v84uHu6JavCgKJzb6eW105Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPQ+51Kf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPQ+51Kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AD51F000E9;
	Fri, 24 Jul 2026 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784879750;
	bh=Dqp12DSYGeWQKJorlJDC7EV+WSWYgY+HK/c12t/h69E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MPQ+51KfRkLceBPUhw8QTi1XJQcKDf6XJGLMh7yA3HgQJAN1buo2IF37oh9/slJ+A
	 e1PVn8u1SU/affnaDoXtdBccvHLGEIdPeRMMKTJSbkPTB9eA3KA2rD54ToWLllbK7A
	 U0JGnFxIQQiVWIJmBDjerY3CkxMuKuGcIe5jHtBg76pbgGzpUu6UlBmVlx6sWsTQv/
	 3GmjLPD8VXpj4h23n1mtVF95MIDlpE/s4EBDgsJ+opiWzaFhbxU2/YUN9yKPM/u3z2
	 x1GxGy8Zp4DjVcBOc4+LSlbs/7F50CA3mKtoIQYOUH4S6A6v/LzV57/JYLF88SkNpF
	 LuP5CGAjE0CXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] arm64: dts: monaco-arduino-monza:
 microcontroller LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-monza-leds-v7-4-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
 <20260724-monza-leds-v7-4-0125a3bfea98@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:55:48 +0000
Message-Id: <20260724075549.89AD51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Onboard MCU/STM32 implements a led controller compatible with PCA9635.
> There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-monza-leds=
-v7-0-0125a3bfea98@oss.qualcomm.com?part=3D4

