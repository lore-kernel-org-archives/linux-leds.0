Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D7D453A56
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934258; cv=none; b=AvnBzOkmqY8W49tJeRGYt0vHf8WUTyYc2Z5HEOvUfRtsvLjyekjdbRUlFBOncUKVSEAerYfhxFs3BOQ4O1F7LKFllWkajP0Tqb6hlXgaWHZnQ4TWYk5HNbkCzAVPW+S8vohBWdc6bWBbRF513pPRRNAJxLXB5rgAXvxwAeVkisY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934258; c=relaxed/simple;
	bh=0vA+bIta/MGNHeZu8Dg+burPzdEV/ILJwUCBTDPYgww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=STWZmA6jRF8haNaPQQ/Pl7OUVIqSlAYmOXGzMm/fyYyLFkJaRzPKadUdyAMs5I8/qsjgq26e+Zlg1tZQfL/pEOeArpLsFleXRbqdpZII32it3VbByVJaoky1WPzNKkOMn7vNzlsrzHlzIewdXo/GTj3e178wxkgNLYG4jQQk/z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeSsNLLv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeSsNLLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04591F00898;
	Sun, 20 Sep 2026 19:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934257;
	bh=0vA+bIta/MGNHeZu8Dg+burPzdEV/ILJwUCBTDPYgww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DeSsNLLv063sonjFnxpY6XhEhrCvQRHqhOMzeE0I+BG9JiD3CRPSoWgfbxpYJ+cSX
	 TrwRDxGNpGN3MmmHL2kjl4DgBEW8twXz2Zus91H+2OHSpmtylcyADorqCkax9fbQ6k
	 9/6FmqYnzbKiZg2GluWYPeYYDBv5nlAxmu/TXZN/8E2qYvkkUVpQQSS4FPdd3dJDGB
	 A7GMAqXQ+05ayqSOECsWFvM1UPkKHGwZP1a8rvVoXOPnTdzEgjhLmmR1VWmWpKu0kC
	 lGRBgmzf0bwxAP241QGJbpStufOpvyQdSxrhpcLUxiM376X5g2pkmMmd0qHVS+v519
	 yzFV3XD9MWXiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/13] leds: turris-omnia: Implement hw_offloaded()
 trigger callback and declare hw_control_trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-7-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-7-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:36 +0000
Message-Id: <20260920195736.E04591F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> "omnia-mcu" is a private hardware control trigger which always stays in
> hardware control mode. Implement hw_offloaded() callback with its return
> value to be always true to reflect this.
>=20
> Meanwhile, declare it as a hardware control trigger as it's forgotten
> before.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D7

