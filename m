Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD713ACA5D
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481189; cv=none; b=psBJ96/LDxCW3vepc82ONC6dpbw8NR6S6+uOTJTLm/ePLcF6LQugoa1APRI1IQkMEDW6DC1HbGroxdkUT+38ix4oRsl8qF/gsHaZhvYS9VY+IWTaocTgoU6o0+qwMuGW0VGFm4tQVzaaCKjxYSrlWBDhjTy+I3NppBDxKH0THm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481189; c=relaxed/simple;
	bh=PRWOUEs8uLKUNgQ2lfonOURZQkYLl5bOb6dFsjguL4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B7bQ4gHpXIjfVvy8GNhHquRlBJ7IkF9NYLZiVbPEpzGOT+T+IVGcOK/Gw2aqOC2YoebjuHHY6wXpSViEcJDevLWS+UfbQzZVPTxfbeQMtB6SgWr/TT/yj8d5ze7II2MKCM+1C+PNKgJG56LQ6ru8Uw+LZErD5XrSImhqfygeqKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEj+Sjq6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEj+Sjq6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06051F00A3D;
	Sun, 19 Jul 2026 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481185;
	bh=PRWOUEs8uLKUNgQ2lfonOURZQkYLl5bOb6dFsjguL4U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AEj+Sjq6tfar5UDo3m/2VHamxbWsPEVfd1r0iWB5QJubT4O0G37MP5ov1G8xCS3rp
	 2cDEqYnoPpe0HBuyNEwAEViJnDFSctbl3pOY+nb34xbsEIXt/4FL4LCTqK+UjRNJAb
	 noKOAt59HSw4a8Lhlk+VHyyhFo6TUnwZ09B+2wVQyWC8AKqhbrNRM9EVyoZKBJ5PnC
	 0VI1Qt1e8yPKxSmDs5IWF2BcO+OWQS1A5etcAzBh6AfFrUFZDP5tg0KM+QrpI1TGmZ
	 X2fRCW5XbvnVOF/H2xKZBIS6nvObb2l7SC6+s9mHeCw8nzD4uGQWJJHM5Xb4LCfi+g
	 6rGiVzbWFggww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 10/11] platform/x86: ideapad-laptop: Serialize
 keyboard backlight notifications
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-10-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-10-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:04 +0000
Message-Id: <20260719171304.B06051F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> ACPI notifications are delivered in dedicated work contexts and may
> arrive simultaneously. In the following change, much work will be done
> while handling the notification, which could lead to potential race
> conditions.
>=20
> Introduce a new mutex to serialize keyboard backlight notifications to
> prevent potential race conditions.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D10

