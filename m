Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841CF3DDB11
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372955; cv=none; b=XmQndFgzXi6X5QYcEdfNWudEXfJxTySNjMCdu90RkvhvWP6UicsKir4w785NdShLDy9NL4bV2G3Z2Mv35On9vaTNadGSXZY+rVwbBBph3eVGDTUAU8tOsphLIozqovH0yLlK6yuVf7Qk9RFqmtvQvPecNlSV6z+iMAPva30Rcuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372955; c=relaxed/simple;
	bh=ksL9HZv/O8w4rmMNii9LVitoquXVvonLkVZhylk3mu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f4fPzFvloBgz/8B8LaAV28O9Hq+nddYEPe6gnagoFTLw32oASwbS+91x2tjm1B9+xpRtrT/ZZX55NV+80LeG8Wwhb5Rc3+dy29aQGYqSunxhmBGQ0kXHOcDm4PCiO73n1wb+NsHgVeUhpIAtli9yjSSu9xbXBMN1aye4uuDwjBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKtoWWj5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKtoWWj5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D58F1F000E9;
	Wed,  2 Sep 2026 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372953;
	bh=ksL9HZv/O8w4rmMNii9LVitoquXVvonLkVZhylk3mu8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iKtoWWj5phUh4hggdXJIW0Loba1uuRozEgHyKK3a5xHF8YGXTaz53ArRIvT9dOjbF
	 O2d1vWHvCVKi/uka1dGTHGiKiGKQTIWI4uKsVg2nnhC7KwS4ydyYquEBCHLgOf6pWL
	 Zrl3Y2ngi97gnXFvgWpn7awsSfX8M8nqaJuAVtBxsqmLKpU/iyb7X7wGgkh/uLcmv1
	 RkckyL/ypdorTZtshTZcz0FZK9TsPmkHrjwQeQ2+ZVcCQFYmrOQ7L9PHfy8jddsu0z
	 5qJw7qULWQLsBqdvNhVj7axvGRArImSukyhplGmLzM5gL6nmdoa4XiXxiLumis/Xes
	 d15I+0g2+1CCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/12] leds: Move led_trigger_is_hw_controlled() to
 the right place
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-2-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-2-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:52 +0000
Message-Id: <20260902181553.0D58F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Currently led_trigger_is_hw_controlled() is placed at led-class.c, which
> is not an right place as it falls into the triggers namespace and does
> triggers stuff.
>=20
> Move it into led-triggers.c, and split it into locked and unlocked
> variant for convenience.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D2

