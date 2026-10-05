Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747F94AA56B
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214408; cv=none; b=E7jopDQ4dssidgJlbiBXOVTmR1Mz4t+1w6TXByGuX9afQb3tB2z7WbA3lBNNHvRqt05OXKhZyQwyOTVPbYWwbQZsvomhRtaaPYiFoav91T2GLb9L3slbpGlnjn45hyouTA4RdVaXyMAtpIpVjwXCkosJLiCA5/CxUdjA/UTSRd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214408; c=relaxed/simple;
	bh=3YUTV6Vh5Cuz8AOYAnSRrgLO5P84AA8T/f0x5LhYNgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IdL9IO9XxDBzNIMbKq4Y7+tYB+iouA4HldAdALZKBAbELirXTYhAtVXe7mnWOgG9vbOL2UJiCk/KpmFlkYzODUYD1fEqgKRxhjrPaDRvNfxDsNB9YTvnYrd5gvJXHEtqy4/t9+8UHWv3JXE9Y3x+uteFX0e5PaODZd/NmxNn2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQwbIMRf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQwbIMRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4851F000FF;
	Mon,  5 Oct 2026 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214407;
	bh=3YUTV6Vh5Cuz8AOYAnSRrgLO5P84AA8T/f0x5LhYNgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PQwbIMRf027oRdhPoALV/g741TZ57EZJbLQR4EM2D5Ky75PWVJApV+JBPQlUvnjpy
	 2vMgFVMzJRSLaB2TasD0SFAQu8EMn8MecbRQAh0IyzGYry4hcQzdBqwHUoFIe/YWRv
	 KtkSloMERAz7ZqDs25fY+zwqI7ii5Way2+pjpqjIg16ngdyuI2CA2NSQUIrwGeP4Op
	 Dp5xmUi9RjQVMqTRdufHTHTZDhb9T+CLwZ56aMhiqlfFzSPUfqZvXBInJAx7dyOxou
	 4KtsYNwcGCJC9VuuDFGdTTHid4FyZ6iRvNs8qkSTdxzwM/FFmzxWhObN7KqO/XYa+4
	 ze0eQd8LiqTeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] Documentation: ABI: leds: Document timer,
 heartbeat and activity attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Ho" <wayneho219@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261005-docs-leds-abi-trigger-attrs-v2-2-c5f8970b1b42@gmail.com>
References: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
 <20261005-docs-leds-abi-trigger-attrs-v2-2-c5f8970b1b42@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 15:33:26 +0000
Message-Id: <20261005153326.EB4851F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The delay_on and delay_off attributes created by the timer trigger and
> the invert attribute created by the heartbeat and activity triggers
> are not documented. They share their sysfs paths with the oneshot
> trigger attributes, so adding a separate entry per trigger would make
> get_abi.py warn about the same path being defined more than once.
>=20
> Move the delay_on, delay_off and invert entries from
> sysfs-class-led-trigger-oneshot to sysfs-class-led and describe the
> behaviour of each trigger that creates them.
>=20
> Signed-off-by: Wayne Ho <wayneho219@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-docs-leds-=
abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com?part=3D2

