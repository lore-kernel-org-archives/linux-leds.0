Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECFE50AC2B;
	Wed, 30 Sep 2026 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782407; cv=none; b=lH5xkv2k95J4OuqaYN7M1+zEpQXbN2CbXBBEZUuE+oh0snPOm4lF7Ga6BpYxj8tWVQvQtbV0LFnPAZRHE/wwUk13TuycGXVSyvvtASW/KKMrxwRAO9TywcT5iq1/B65dSH+D//DSY3+zGa8nOUa53Hui3p8P3QoKS4Ilt3YWX/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782407; c=relaxed/simple;
	bh=35xhYaj0FnUABXmC74lV04idpOI1SCIB77L5o2f9iW8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ivG6EKfg2F+UVXob/RLc3xgRu5ZXgxcQCuGYWwV1TN2Us7a8Ei5pZADxwqqgVY43G8/xnd0FZzHaxmD94Q6WBdq71C/RZSk4b5iSnMpiaiwLNqCx/Nyw+dCe9o+U9GVTKNeM6mRSmjaKKII4dw9JIhafLkYE2NZMSdO+45oY3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKx3VmZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKx3VmZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067631F0089B;
	Wed, 30 Sep 2026 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790782387;
	bh=35xhYaj0FnUABXmC74lV04idpOI1SCIB77L5o2f9iW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cKx3VmZBnaKZM6rW4DHGzlptXy/d+A8YP77eZhuRUyWKIqbeDO0rfVggKQAjRWL18
	 w8z5LvXETl0ZAH8/cmvsRRvEqVAHRgzYyckQL68cLnJDAlC0ryDxlG5tNl5ysNQLfG
	 1Ue4hu85GNa7fOeMb4HKVXu4otfuV6jMtYCPRFi409vzuvDjc+NZXEwzYeUszWnDAF
	 q3a7tC0e6FEnhSdngE5QfV+xP2CeFt/DLdjx0eBuoxgTSQc1GpEpRdIo6C/Oh7ZqaE
	 rAeeaXDNXYiO/f+Db2rC+ANPt0mDe6G0LaFBKnos9Anury7ftFa3Yw6v1nATY0hr4k
	 mP/an5Fc8u5PA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/10] leds: pca995x: Write global registers before
 creating LED devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <c46f7e126c08a53a8f04643b5bc8de3145ce84bd.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <c46f7e126c08a53a8f04643b5bc8de3145ce84bd.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:33:06 +0000
Message-Id: <20260930153307.067631F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The hardware setup should be finished before the devices become visible
> to userspace.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D5

