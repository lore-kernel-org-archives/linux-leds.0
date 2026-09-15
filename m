Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C33B27C9;
	Tue, 15 Sep 2026 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482172; cv=none; b=DHmKCarYumJwrQiJiBGWuCI1MMGBuSSA1bCiMJmVGeYKOG7sO3ht7S1VtsY4l5cxVxYpLy2+RLA0oayuGPr8u4XHOHj+XsiNTUlKlHk8bJQeminjiVRPmyVjtLt8qPrvXEfayEGCxbQNMUE47xfznzqEfC8qEfOWOt89+YB+31g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482172; c=relaxed/simple;
	bh=bm68wK3wGEKiUPo1QaDDPGRQvQAnxFtaDs7RvTLJUic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oJ5vfMFIskgenByiaYE1FmJP9BUad8omILdC4FP+leIwwpwvBEx5Z1hcOe7SHGSGbA9rxnrijX1Nh/A4qDTawcZJrIakZ5OstAg+n94arFVCmmQ46aPc+adoo2HmGXEi4fNbByLWABlYL1XkSAMifCE8m9DzR4GwLHNP1kDa0SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ddn0wr4q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ddn0wr4q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C201F00893;
	Tue, 15 Sep 2026 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482171;
	bh=bm68wK3wGEKiUPo1QaDDPGRQvQAnxFtaDs7RvTLJUic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ddn0wr4qccW3avGzZx/byo/zjpvfJrsedEc/NI04yvN6kTg1p8+XdpAD1spwYGJKD
	 mCCEvVvPUAtgVjNVCB+8UTgTN8ZVPHAqDMFv8rXA2yGX8kg/NOwjHtlRVXdLsG8Q5G
	 VWzGFjydueUbpya+VTg694JLWNImUxJl/Zw4KegHev9RUnNvZH9gWrNk0i1bVsyDzC
	 +X931acgF8R8BW0k5DjbpKehWfh8DLrCacOrEfv71OqsaoLUETG4QLSSeUDdMT3JIE
	 file1REUXqXgQ5Gzbq1bUwJcAneS5Gv0rTJWdeDL9AepPvw3wP6zY0ZTPbThFerKd0
	 L/QOCoqe+g9Dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] leds: pca995x: Add support for reset GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <8a1af648c47041ba8ea564884c4322cb766cf9c2.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
 <8a1af648c47041ba8ea564884c4322cb766cf9c2.1789477502.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 14:22:50 +0000
Message-Id: <20260915142251.24C201F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The PCA9952/9955B/9956B have a reset pin. Use it to reset the LED driver
> if provided in the Device Tree.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/bd687915af26ccdbfc8=
cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com?part=3D4

