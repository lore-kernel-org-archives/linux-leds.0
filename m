Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9AD4C957B
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331792; cv=none; b=OdW8LoUazm45p+4aUlJq8AdxTjZdCt+n09mSrP1cpLgKKHWBI0zxXYVwwbT0N0wrN4T0FSS5WoXmmH+aMae1B0USpEcgs9eNPBBxzij8mg2iDXnsWPa0RHhhlycMMIUPDz+3bZ/UcNosBmn2PwwWeEELFS08WXu+iBntqJ77y7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331792; c=relaxed/simple;
	bh=+Af3Y64A8KokR8P8qauGswvLjADtu/rLtqUXVWY5IlM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JSlmSmJ5ynT43VoZdVr2WaCYtKoj80AaA92wz6L8X/kQNkkk3mrZ5IxxM+kX7KDDONyvJQ/9bqzBG73IWOFWei77Wf/sKpDTBE/PFH4IX2mOFniq3RkJF1UUwuxC2Klx2sEVBflpQEwz/TSxDFW/ChNhv7Ll0Wf8ZeWkzJLG3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dM1X/1w8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dM1X/1w8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B001F000C4;
	Sun, 18 Oct 2026 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792331791;
	bh=+Af3Y64A8KokR8P8qauGswvLjADtu/rLtqUXVWY5IlM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dM1X/1w8nLER5IXQ/q3bOsM+O+HUR6u2R90BDGFZnZXyOxe9otldGB7abspqn8J1/
	 mz9Y2WRhHaxyJeW8PArD0fARbxGObtuiPZ789aSixYCJoYc0//W8kbJSXjrHDg7sjr
	 Hf4De45lTTp7iA9JjBGoHkje5LyJDuDy6IfXLroWfEDaqAm3rUcKgRy6zku+3iW2vJ
	 sBjxkmfqgxdHKv7dJmpsEKVyvWEKuFCgnJaj7c+i8wRpobOCrpwvYxgra0snlnSVYg
	 LY/6HkpDNydWSE3+NP6/U+zx7+tzD7NjWz4VHa5YrzcqTsCyDdaaKBw9lRKADIhwRJ
	 ItbTHXRG70TBg==
Message-ID: <sashiko-outbox-176167@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] leds: flash: Constify sysfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-4-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 13:56:30 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Mark all sysfs attributes as const to ensure that they are placed
> in readonly memory to prevent accidental/malicious modification.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D3

