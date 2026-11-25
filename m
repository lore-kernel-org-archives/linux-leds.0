Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612045;
	b=epWuzZi6oXImb4FxfElBAZ2NFT0Lb5d8wjMeXXUX7XKppgkkunc0Du5OS6U+H5qZNo16
	 VxvHNEQ7h6/74gzpbI/6+Sa983nrmBxqZyqNNC1Wgjw0I14CYsV9V1CWvv9/REFxPurCi
	 2mX2yXaUnmwVTaennXFjVTNFfnxyWTt1p48Z/m0fAOnb9dUZraGqXayTMbfOUSIIE3JCn
	 W8/uK1meIgw8ArAmT5rDDtayDjmtzs3VEuhAba6M6N6zPT9qas0v1UKa8H/TCQl5huTBM
	 9Ggcth8zK8NOP8QgJngsXBEgyrhpr6o48omZwNN5I59/oAec1FQ94hr9fLP6dgHzOTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612045;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+7GqMYMo+fDxggOF7vjg9Xml3IRzUQcrR4XpMkTxCxc=;
	b=ArYe41ArikRsG+zgBUefXRm61k2Q3vPk+3kiXxBloUsZ6qzh+Iu80MMUaK1BdqJ2xZPS
	 Lm2uGOD5O0jK57cdNUyNaoaDpzrKMKrpKGGsMNFLQbqI2ple8GN8b07jZd5/n1BfNprfN
	 htXWXUvQgYj5fIdol1hbnRj7ojf2gs5GujtH/0sxIh2B8dUIfxPbfsgkxvJE2so+/yWuH
	 7++fhYG3oLHv75p7Rlmh0JdtxaqyCKUG22l+H4QIM0LisIVkJJFTSK5EpZJ+1iidmqqzy
	 9hTdBHGqr7kMetkmlzWDAIPb5uaoYEKwZq71N37de5l+i7f9z/+9DWjGeVsOkwXL6tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yt5RyQcx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A552606A31E
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yt5RyQcx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833011F000C4;
	Wed, 25 Nov 2026 13:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612044;
	bh=+7GqMYMo+fDxggOF7vjg9Xml3IRzUQcrR4XpMkTxCxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yt5RyQcxRcL6MubVgXD3Y/ITapniYTwp5Q0RJmmqhd4mQAwJvumZr2oucwFnS8guA
	 BBl0m/eat518cvYAgUQKKBRo0KgfPXma3X0bc4sYwcsgTd58Vvre9t5BvOVDt8CuMi
	 QHsgHs/uIQKKVKSQ+Gr5C/FfKO8ijG5RUvOGdQni76axpX7w++TBCB4u29HjV6wVuM
	 WUtczRSDNWkfzRNR+9MzyRt6+jsGJ+ORBIfJN5ZF23F527Gc2fdrhompq8Ca2MSw5E
	 QXXES3KNN2ZfzcvHtwfjtuz1bEvCNQKpzrxGxlEJRjcweulKnimte+QOXTcQC04hSJ
	 efUtFdnqXkwLQ==
Message-ID: <sashiko-outbox-233456@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: rt4505: Put the child node reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261125130318.2590336-1-congnt264@gmail.com>
References: <20261125130318.2590336-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:07:24 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> rt4505_probe() gets the LED child node with device_get_next_child_node(),
> which returns it with its reference count raised. The driver never calls
> fwnode_handle_put() on it, so the reference is leaked on every probe error
> after that point and on a successful probe once the device is removed.
> The v4l2 flash sub-device takes its own reference on the node, and the LED
> class device only stores the pointer.
>=20
> Drop the reference with a device managed action registered right after the
> node is taken, so it is released after the LED class device that was
> registered later has been unregistered. leds-rt8515 puts the node of the
> same kind after registering its LED and flash sub-device.
>=20
> Fixes: d9dfac5419d0 ("leds: rt4505: Add support for Richtek RT4505 flash =
LED controller")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125130318.2590=
336-1-congnt264@gmail.com?part=3D1
