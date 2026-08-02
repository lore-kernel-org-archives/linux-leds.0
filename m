Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22A233926
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691913; cv=none; b=UMpbtzHEok3cDKFfXRZt2cEXYIQmRq/A1PEEzBkd9bES/6f9YpgJYBkRZ6K8dyaa2UbfOKmczXhuuC/q0AhAJwyBsCuapG5YmYieDC6nC9ZTqt/u48iR7OU54KSVtzr6RA+Y3AOKHG8anI8DOjJSCASS0lhM1c88Oo0tLBJ6Gqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691913; c=relaxed/simple;
	bh=23Ieo49rSp5DmBt5Kn/BRPDSq0W44nP/FKTN9QzfgfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DFkCCQ5RSWDLNM/+K/gl/wXNBtZ7M4fazY91PzhBmcI9kylL6ojhEq69rJTgLrJjq0wxD30+SN9PqRFajD86/PekeF6+AbdU//ACEzQunMgcKvy9MLQpzxWWJicPff8V/SNOpvW1SNbqWU20hbFHEhLEhYgU8fdfhvSomtbGYRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YL0pwWlP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YL0pwWlP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A336F1F00A3A;
	Sun,  2 Aug 2026 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691911;
	bh=23Ieo49rSp5DmBt5Kn/BRPDSq0W44nP/FKTN9QzfgfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YL0pwWlPB18ctUcbg69no//YaF6ALMCjaMYfZ1XARdd8PfSmwBg4hJ8N0KLLA1Zx0
	 xw6F3Cf9qa2u9mn26mgHRiH4K48Fs8aRaIJQtDGwiM5kdE2DQvD+XsKkUegesfatXq
	 dcxLK95QffZuvHW+vDvO7gzy5vLGW1WsNb2sTEakMFQGCIETR0PPklr0yhA3J+CeU2
	 +XenQn4mvN6xaB/pCSN+BIaW9WJyw17vppzNpGOuRJoPqs2X6ZljnHdlm1pFCLNI44
	 LwntkPGW/tLuQB7XmGT23qa327H6M1vFVuWamFAXCihm+pgQTdKTVp+zg4TJ/OmaWu
	 WbdjO9WQwa/hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/12] leds: trigger: netdev: Implement offloaded()
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-6-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-6-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:51 +0000
Message-Id: <20260802173151.A336F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> "netdev" can run in hardware control according to hardware capabilities
> and trigger options.
>=20
> Implement offloaded() callback to provide its hardware control state to
> the LED core, and document the relation between the custom "offloaded"
> attribute and the generic "trigger_may_offload" attribute.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D6

