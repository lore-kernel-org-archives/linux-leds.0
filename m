Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764432;
	b=rxjIDlTzGOv3oZJnmK38psQ0p4PIO5H9DSMwS86XakssHBZi7YQqyOeei4pcLCtSZQsT
	 u8krQcLMcX/ba+2qnVMHl9P4Ygvpg8Ko+Qgky9fInMjG670LXeOSNa13Xmm/Xn2BR7EoI
	 O+RKswbTtfJ7DZcZhqflB/VHlcrIwJxArWY5xL0W3HP0IsidNOyFnR21gX9u/W2E768s0
	 7IwQLApkNqCHgNrJJxUlBJIfYdhv1G2UzXUqhvyYnrFj7FS6SPtTAEMgQ7yZ8E+WM+wXO
	 K6HNE8O8uQkHgbJ9yChdgmMR3HP7sthpq35ewSAv1mry1AFTnUNZFVBm5xjrM0C2omQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764432;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=35WI+vME60fqtCeoFxXt4NFu+4ZKm51L0iVSxW8H9iE=;
	b=QHm32cyaSvPGyjRCRmT41AAnCKrRovQ81ngDa5ToTn3q8QWIm/1tqDM5heFgXhwfdGnw
	 zDg+SCzdYXFFl6lMyYnt5oV2QprrOmiX8S5L84pWgph3+HnaylMHlQF/llNuvMPxcOZ4R
	 gCuO6tQ5rvofQexqwSFBtBratMUxIkMd0q6tM+l+etrGclEjKQL4fDOTrLdqKOESX1yWO
	 LTDafR5YFUiVOCvoVtE7eviXWeNWo2ykN5lhLkSozWz6tDhNyaMe0R4t94pi7yM98QE82
	 3v/NX33pxqe9DS+lbXw3jh78CsuzXcMxY+vRBIM27IdC/ZT4znK6MayOd1Vvn5tzHIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LC7kEsEd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EC9606A31C
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LC7kEsEd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FB11F00893;
	Fri, 27 Nov 2026 07:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795764431;
	bh=35WI+vME60fqtCeoFxXt4NFu+4ZKm51L0iVSxW8H9iE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LC7kEsEdgidAYMjfDKxRbqf8JZr+xkF6FSQeweddk3NFThN0kXICAJ7fuTURIjGoZ
	 tlXgItAQUbJOOZxrPZ285J8fTonuJeyHhdXoUYmKP11DKSskhJ9uAj/pZr1ph8LLnQ
	 BAkB9vusJO7nP5XcivB7Rfwcg8nndhU3eQSEwtzJKz9M4OVVpiDxSha9UW6C29A0+x
	 7LK/9jOgC2sUwq6imqOlu9XIzUA+FlRslrbSgy0genxmRZsEs2Eho+4sujMBYYjX6B
	 3tOQCMGYDhcJdORO5GLz+oqItWTWtZ6ucf3gj+NFgV+Wo4guQ/buG7BrauuOg2NP9n
	 uYSCm22SuDgug==
Message-ID: <sashiko-outbox-236801@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: sgm3140: Put the child node reference on
 success
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261127071831.136694-1-congnt264@gmail.com>
References: <20261127071831.136694-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 07:27:09 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> sgm3140_probe() gets the LED child node with device_get_next_child_node(),
> which returns it with its reference count raised. The error path puts the
> reference, but a successful probe returns before reaching that code, so t=
he
> reference is never dropped. The v4l2 flash sub-device takes its own
> reference on the node, and the LED class device only stores the pointer,
> so nothing else needs the probe's reference after probe returns.
>=20
> Remove the early return so that success also goes through the common
> exit that puts the reference. ret is 0 on that path. The goto before the
> label then jumps to the next statement, so drop it.
>=20
> Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127071831.1366=
94-1-congnt264@gmail.com?part=3D1
