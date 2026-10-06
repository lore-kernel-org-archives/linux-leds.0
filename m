Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F66B1CAA78;
	Tue,  6 Oct 2026 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258972; cv=none; b=tojjGpMu0cihvhNI2hk+DfyYVgO/3tzjD7Kydx8KfG28Lr9cdEe30Ulq0ZK6e9tHvkpKm3bXRgl9GCB5UmNER5fsa5DiRJht0EfnMfeP7mbAaS6pAcoZoYyRgTrBOPyjF26vagfhKxXV7rOSxBwRoJXjiY11eBa0Xs92Q3OlPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258972; c=relaxed/simple;
	bh=0FJAqT5Bd1aCROTryBbqfGu17WtpfJ9fRMYi3pJzUjM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EDlAMc6ZYXDE8AVsMzV7NIUrt2ArXi46hkD8mOSE6NPH29PFx3SHPWj2i9KCICPSGHrYDIw4HKY+x/nYPqyZMQZ1Jl0eg6sKM1IjVZ0heIAL67PEdGQAt9w9Ef5U3gG8m9BhyEUZpBNwkzNgJNu5en0S/IsqxR2+5qoXBjHgFlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZqIKbRp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZqIKbRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440711F000FF;
	Tue,  6 Oct 2026 03:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791258970;
	bh=0FJAqT5Bd1aCROTryBbqfGu17WtpfJ9fRMYi3pJzUjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AZqIKbRp9R9jXVtZNezqP8lj/OKKIbH+JEF5QLNEcbp3iomkBSn9mgxe+XBFdoQVn
	 KuMoCqd25lX/PctwxAAn1DN4LDrTvwrMK4LtEJQe99+jO773DFKhtKPWEq/5O97zsG
	 5pciMlcsmZfeBDYfQft+tut9XE960agqf7aQj1qU3cd6BvI0/R2k+BRb1kkVYvYN0p
	 FDCeWuvVijH8TL1VM5fsXFRHZsWRLvr8VHvjHiNsW+DlvRl0qu3zebgzNJ+hggyEp6
	 7JwuEqS8p4tX21xY7WD1wi1TokkYrhXAsIi8o4853rASX+K7JZbowe5x0K5I+LN4oI
	 624n/mDwVyqKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] leds: aw2013: Rename internal APIs from aw2013
 to aw20xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-2-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-2-108ecbdf2775@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 03:56:09 +0000
Message-Id: <20261006035610.440711F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> We don't want to break external compatibility, but it's better
> if the things shared between aw2013 and aw2027 have generic names.
>=20
> Split into a separate commit to reduce noise in the upcoming commits
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-aw2013-aw2=
0xx-rename-v2-0-108ecbdf2775@postmarketos.org?part=3D2

