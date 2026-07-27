Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FD23ABD83;
	Mon, 27 Jul 2026 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164326; cv=none; b=pAqIz1uyVmshPDI/Mj4CJXVPqFA4zd5VXze8c7EOq6GzE7z19x/52lRTbd9+/W2CFM0Suk2Y9P7uReyMKiuv5zKZf6oG2PqoHIbogBzNDzyaKw4piPHosqNi1/nLaeGGmvLAUOFtdNLk8YC16GxFzvVN2OgqRvySbenwpyJsfbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164326; c=relaxed/simple;
	bh=9zBAxtNgg3yMetoUs1G6xAXup+3J0QHnjtvZBZFgtNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h1znLE5+15vXJJb+Pj0l/kzWqQ1FaneYkIEn3vU5BuVaI3w7GKFksXdCeBRwfgH9S1MGgA5fKbkXRFtRecOXTdDuspwJQYbddD3rvelitP/mIxyQI26Vvu3FOlamGjf07btzF6SkCqxDvsYqE5jld3zFt21Fi6Rj4vw4mdx07wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaLBWmyI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaLBWmyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B8E1F000E9;
	Mon, 27 Jul 2026 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785164323;
	bh=9zBAxtNgg3yMetoUs1G6xAXup+3J0QHnjtvZBZFgtNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YaLBWmyIw0lN+F2nJwRh7JJjQh5Jatb8jWmg35s18YZwDW0WW/L3d0St/teJI1Cz5
	 7/3Z+ARnEmJ3TKYIuf/NKWpCp9WD0pD6ku1sbD92FWDCW7bZWJdE11z9445QNWXaZE
	 jxd4FQEo3Y2Y2/WRKwcF9zzXYEum5Ci154nkcEtgEdkquljxHBL/MkT+Ad4qti8fnR
	 m9+1HrgDGZ9hKTGSOn5y7is5RCMp/QtSMlgbp5CtD+xSlxaYVwin8fkW1+1ixNw4D4
	 x2nF0uMe4o+oepYpfa9OUPfKXKM2qEAvEEUGwANMhS0KpgrIA4nfQje5Z1HDWehLRc
	 PYmTL0LQin39A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/4] arm64: dts: monaco-arduino-monza:
 microcontroller LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260727-monza-leds-v8-4-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
 <20260727-monza-leds-v8-4-6e7e93d44dba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 14:58:42 +0000
Message-Id: <20260727145843.33B8E1F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-monza-leds=
-v8-0-6e7e93d44dba@oss.qualcomm.com?part=3D4

