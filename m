Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A1E440A07
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094056; cv=none; b=EBIlFWiPX8JDMEGC44zJm5vicGywIYq55HfW5+HoQWqV6wk6sAlKB65y+1VUddpiFVUtm6qSnw0aiLhxIDS2ShFZJnkmXcobEv4THqKxqWNl3WMvWd+9GGdALB0HtCyc/VWGt/3dEMKDPulkFMyR+GuxfuNiMY8/TrUadqwhiIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094056; c=relaxed/simple;
	bh=1gu5Jl1NC00+yWy5JSf5AHLNaEmTdgDRup5KYgBAJMA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ToDXM1yYvnU2tHQBVnWILM4/8LSwFxf2cMVE02Bo/99iL+QSraZcEDf/p2bJ513Vtp1X1C4Evg5mhbOGEx4rMSY7LCYvI9o+wVn68a3FSmWxQigoFRSuPZr3G0NbaDE5cuAug/9nb893JY+EfFwogzmCG0jxb/wmnvJcl5G2ar4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBRsBhG0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBRsBhG0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9B51F000C4;
	Thu, 15 Oct 2026 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792094055;
	bh=1gu5Jl1NC00+yWy5JSf5AHLNaEmTdgDRup5KYgBAJMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SBRsBhG0PVmffHGKV+WXahI8MgOzrGIhVTgHQiK5JKem4IAtCO299sNcoMBVvDPfg
	 HVgkTL0912sxkY3HPppyhKb0osixhS4nltCZyqrzlUOiG4+tEH2k88KlAXPg6j/TFz
	 b834aA9Tbi63BOhUxVpdglWWfdgjqycC54i4/9Lwsrz640AM67jl8rnN7prbiOOH10
	 dcGoiBE9SjXMX+RX5bNQ6f6TiS+whywqKTbFrPvy2AqPI/PoNp3KBDxOPcYxLaltxV
	 R6spxiJlrw+EKeH45r4Jg+HRXXxUJO0I2DJ55WHA7RpjhDL1VPAiC+xmlsVPR329nq
	 HMdVj860k4yig==
Message-ID: <sashiko-outbox-173370@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: mahua-t14s: wire backlight
 through pmk8850 pwm
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261015194732.64428-5-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 19:54:14 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Move TLMM 18 (EDP_BL_EN) out of the panel node into a pwm-backlight
> node and wire real brightness control through the pmk8850 PWMR output
> (EDP_BL/PWMR_BV_PS on the schematic).
>=20
> panel-edp was asserting EDP_BL_EN before eDP link training, turning the
> backlight on ahead of video. With a dedicated backlight node the
> framework toggles EDP_BL_EN after the link is up; TLMM 18 remains the
> LED-driver enable, now gated correctly.
>=20
> The panel takes only its 3.3 V logic supply and references the
> backlight via a phandle. Brightness drives the LPG/PWM channel on
> pmk8850 routed out via pmk8850_gpios gpio5 (func3).
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015194732.6442=
8-1-srinivas.kandagatla@oss.qualcomm.com?part=3D4

