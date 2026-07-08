Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BA8246770;
	Wed,  8 Jul 2026 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521055; cv=none; b=Z64rD4XqQAjsNaH/Qplzxm8Rgm18EPsxvAOWyNT4MSA0chY9CRvWPGCPUvONogVXnjuvKzeY33e22ihU9S5c2sNfWhqWeCDY5BrOF1phGyqoQ9KCWr7gh/Q9MITkZp25ll9nEHGyP2Mo4d/iySiWwDv4on4npEusV3F9rewJVKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521055; c=relaxed/simple;
	bh=YXZuqPNVUUOkT+AgykowdPZnmUPDkjYdDkH9WeiCvvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h2lOZgVKXla189f5rHUktzbT5FqyWk02hQz8wMtSYrUTDPBcnqbgYHRdideYBsCSaGS3aYKnWOVNRfm/0zVin7MaKeSRS06mId5ajIeW9nQ1AjGSEm2yWwVVeLUnUYONm9qx9eU3ApfbKHwbsUUXfcGbQInCQ8fGLg1uwgAKS1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dddZ7iIC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dddZ7iIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AA41F000E9;
	Wed,  8 Jul 2026 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783521040;
	bh=YXZuqPNVUUOkT+AgykowdPZnmUPDkjYdDkH9WeiCvvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dddZ7iICuqTRiT61pXVPcFZmz8xSiYhovGjcbPj5haAkFBXzfz5H/VVFuLxRbNQ+0
	 uYHB6BI06ammaCwq3Y3QmD6sujc1o7CrC/4PXcdgEhdOfJyPnQ9bxKjmgYIHNezcbG
	 A073LyGFqAXws1uOvrOioRX2GIFGxgSvNFvZYvmZx5ElQZH+9a5pncLOs/eUvIHGBs
	 n+5dwXcWNPWXTgzCxPjU9FK0+KRHaZuqtKObJilwQFrUp31DA/hAhaDMDIETnyE6qA
	 dNbMfNBRMjEQxacsJpXjRW9ShAEcEdtdfiioSZzAlsOraa39FOAzErOu4YHpDsorlb
	 VCD0G/2bE/nog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: monaco-arduino-monza:
 microcontroller LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260708-monza-leds-v4-4-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
 <20260708-monza-leds-v4-4-a7acfc524c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:30:39 +0000
Message-Id: <20260708143040.55AA41F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-monza-leds=
-v4-0-a7acfc524c0b@oss.qualcomm.com?part=3D4

