Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D25D2F619D;
	Wed, 15 Jul 2026 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123701; cv=none; b=F00LKVaaCrvA4UNHvnIXqlBV1e3jRgoUp4KDw1X9N81fwfLbwyoBw/iuJqppJFkFZCMj0XcGNHtTfJsms44KJcgZb8lfzz2f5VHhAFLtQ2uWpjCNkrWX1iLIR+8ZtsZBK8s4KmtrndDN+Qz//kah4r+GKxXIFCST1P/6lCohAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123701; c=relaxed/simple;
	bh=aanqpJ/US5gd7xyYkyNNDmy19JA5TJJl/yLFQjbdT70=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d4Tw3s9KPU5MGsdUfjMAavLWwiWvibO4lOoJId2G+yRA2UX0NVXE4h/OJseKiPjRSiAuRl/8/E6rqd28HtTs1cYv2c3lIepLQRoTF7p0G6WTvZDAQWV+HFtT+PhbXn9Sl46QMhYKg/BArWPRPBBsyI4I1DDbr19VXK4s3Ry/x0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGArcA0K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGArcA0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19A41F00A3A;
	Wed, 15 Jul 2026 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784123700;
	bh=aanqpJ/US5gd7xyYkyNNDmy19JA5TJJl/yLFQjbdT70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YGArcA0KzV+LmAzIFMD/tyb4PdEi9DN3xSqSWnV4XQynuyzadVJevCh75OhCgtllx
	 1ekHwz3F5LTUX8nadL/7Z1df8aeN9pwKB270wDUbM5e+y/jy/WcWPyC/sUS+RumQDn
	 zIF76FRxP9X0cBh43+ttIckEffEwLoFkFT+0TNwJbSwxOshduIowSuG23Xrfc7cvtF
	 yw9DTD3DowT/Mhq9Op531jspHrBUiMsdBV24e71sxzNmRXN0sS5AcqExw+n41GwkNy
	 +c8sMBGIyeAqLQy5vjE6nLfVks/SBA1bAIMHXn8YL4LNTh6bIgiBDXOAZogF+T3V/i
	 uC//zukswWRdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] arm64: dts: monaco-arduino-monza:
 microcontroller LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260715-monza-leds-v6-4-d1724bb7fe3d@oss.qualcomm.com>
References: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
 <20260715-monza-leds-v6-4-d1724bb7fe3d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 13:54:59 +0000
Message-Id: <20260715135459.F19A41F00A3A@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-monza-leds=
-v6-0-d1724bb7fe3d@oss.qualcomm.com?part=3D4

