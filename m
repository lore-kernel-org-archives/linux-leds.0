Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2556638737B;
	Mon,  6 Jul 2026 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353450; cv=none; b=Vf/hQCVkyjwcsCGAn2KCdjhOKvYmVl7xwn39MtniJdHgjCWbTrmZC15j1NdkaKWyNLCJTkdK+xNoTCtaIUxNV6lhwcQYPiEtlJjKakR8Twl+lAHDQVQX3yqe11gNSm6ycMS6ePaUnd+4AVI6vVJ0y2KSPaGwroNAp4r5sfSN/M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353450; c=relaxed/simple;
	bh=YKIHbxFdI2i14gvm0UOnO5VkZqf02X0SCO1tA1qTdG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ldSO0uwk1VbNBKAWrAhNgLLyCryUivBPqFa+kyejqSKVJEDUbV1g6IqGDlqOoU5RrFat3iXy7iXYAW3eHDKjEomklEaffx8CkyhZyijAE/yUW+BEqIFJ8RVOxAmuB5MIl9dnN/FZn0IQjb6ZZyWTourZhcvKoZRwfCf3YHuQVOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7NqJx1v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7NqJx1v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81F51F000E9;
	Mon,  6 Jul 2026 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353449;
	bh=YKIHbxFdI2i14gvm0UOnO5VkZqf02X0SCO1tA1qTdG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M7NqJx1v7o116oH0M0EVFPtXOZesYx9LTecQvYr+L41wl+NXV7rNsfM7oyyPok1qY
	 Q8enl7mIufyw6Orvj9J5CkbF5Dqy6rQv/WQ6wJaac0joXbgNFwHzIkqYtufuiWSxB/
	 RuFZ5UyYRcI2EZYu1GbyTNhKg/xXllwDyoFvWICaLWfx45qap7Ct/5OmO7irvqvutI
	 9nnkeZSgu01FoUgIcXZ48L1xd6hhQcUVQBXKoS9lRg3+kVSksBjzRLyJDFKCFBfVdb
	 yWRxbWQJN86JHxuf/X42J8TIpU2AHL2d8kyXj6ZANDF+tC4zd7zMrSGcShEkFi2ihp
	 BZhp0r2IOWklw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: monaco-arduino-monza:
 microcontroller LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260706-monza-leds-v3-4-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
 <20260706-monza-leds-v3-4-37ea8c988363@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 15:57:28 +0000
Message-Id: <20260706155728.A81F51F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-monza-leds=
-v3-0-37ea8c988363@oss.qualcomm.com?part=3D4

