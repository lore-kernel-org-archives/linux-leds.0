Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B92949E0
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791316386; cv=none; b=QnxDg6vpho0vYKDAGVMNgdsRKMAehLeXnzktKwNxAB02hVY7jCacj27OTL+NRoGa8EnGfjPZNkcmMKzHUJvanS4MEX3jO5qMG3/LLb5gXz1Ol/sPsKJAAepIl7FBfahmxX8eDIwn41tXKhIZQfj082gEb4Bc3cQL0s6+iNGCWqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791316386; c=relaxed/simple;
	bh=NJ1pRbRnKJmFoEUqhxcP8u3zEH4RTXw94iffrMDycjw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SzZqLJ/oS22jLnojV/YIVOxW7kA756Si9XBbu/Kc+wTjiUNGJROGnSiBY8tWKgxgZ5F9ZqQOlQInH0N7p6zcQBEnDlUT3xmXdfDkKZxo2V1/Y/5+bWOVey0mG8/z4f3NK4hPvMlBd3dG6hfpfSaHM8ungkzVvYv81U/TCatW/e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=MKO58mlB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gsz6Kehn; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="MKO58mlB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gsz6Kehn"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7766A7A0113
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 15:53:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 06 Oct 2026 15:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1791316383;
	 x=1791402783; bh=xldaJtJatu9aKIUiDCxeXNusAU6qzJ37au3HT7Fm//s=; b=
	MKO58mlB99lpRYtnQGXQi/Gqymg1LOnKQ0P2VSuVCP+AJhRjGLYpDTwmxP2ZB4wC
	JXw71iv6btSaOEt4168OSBtiwpucLPvkkC/AtrTNEeS6jrLjiVS93Buj8oYlEXzp
	9UfcokbCy7/06HiVzp3HrjwDibHridTZl87Mw5WOWjhJE9MESfQvzviaRDLdkB1a
	98Q2YtU0pX0MciYpqrZ1TYmhygJTFYa9+JyVOZElzB8BTHhu0/UOY+y9JF3R1o4H
	K8H16jbpkdaCZWxR4Ou6sNLgr87yLud3kglo+v9iVDCB96BmR0vU3ttQMO5No3Dd
	Q2AEI0a9YZMf+8GNoiyD1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791316383; x=
	1791402783; bh=xldaJtJatu9aKIUiDCxeXNusAU6qzJ37au3HT7Fm//s=; b=G
	sz6Kehnvxal+l9c6iWyqS/rMoV0CHTYulMfg0yCj9GjLQJMZMUMXydC7uZpXKGOK
	2nrlvfppza75jJ0RzgCIwOLnbg+8Qz3SrOgKVrapnToRG0g/ZaZSjyrv+HxpfhHg
	uoATY1sSvazo4neIziCvYUDrb9f3BR3IUjdF/lBUnKV4bHrPhLG40LjGKhuw7dZI
	GmKCgL8ItGp+eKfvr+Jw4H82twyj9Z1Ozw7uoaydQ3zvO9GNjKxIjrKrVGJG9tcf
	4COZzggzCSVoBry7PGSds0hU9WjfA5ltMBDU9jY+BU2whY5RSUJtJylVmghdg/KC
	D1uAXvydXDD+z30r2cYjw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791316383; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:G3uZ1R3LJvlPR3H8dTS+TxXJiBAdOWnCky8qcYG9re1NeCm
	proX4Ws2V74iPjtMP7mj3mXQKh+K/5j9mLATr/KM20YrEfxTPeWoAgCz76NGYyj+
	KyAWciwqw/+/0DFGLIdVzIMT6KD7HSgTVNE1p24vDMv4s7w6vg6sbRIXSQ6+QwM4
	SHMKelTAFFmr+LXve9rcQXO+gfPSEBoUgZNGcJVDApA5ZTSTTBqymrKFJTiUL/RG
	eHpSfTna5soiaDk2pdGyBJCvUBrheDzRStA8yAtNc6kkJPeXIMC/6z9XRnhwiSer
	BhnY1Kv/IcGKTeRdk9lZ+qAJ+YK7yR+aN5WHeNg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:92us6Jfvd+OzOP89EiR252Amh/mmuVAJqo44MSKg82k=:NJ1pRbRnKJmFoEUqhxcP8u3zEH4RTXw94iffrMDycjw=;
X-ME-Sender: <xms:nlHFauyMTadoNQ9UQoNF3d7oR7xIFl9MBDdTZFR1NqDHhcM9JuXzWg>
    <xme:nlHFavdPsaptcc7khSbsflMN1LlnRxFgg99cKudBqrGUQfM2OMD-atOz7Ybc9aZTC
    JuUs8sGYZLnX2UmVDtGfps5s63fnYicHHhKjCx0ZaMxAWORfeI>
X-ME-Received: <xmr:nlHFajt-dQSrh-bFkdied0Z-E2CTpvC-Ew5V9lhjeChNBWkS8Q9JPXZWnf4kQBP-1I2UWuvOS62er1VO6yJXsh_cWQfk7rj4NIxMHGlNBg>
X-ME-Proxy-Cause: dmFkZTGV8nXLgn086JaXf8cevSE95/GulR8M8Esy8uUy4s5UIlArkTvX/QFBZiEJ4YMSRs
    bZ+4UyNhQoyfBsmfOOo4RjwrVO9Ao24AjY2aKjUJkeEpKeS9ZPvoxFRiSDTL7gOQDE2Gue
    aaOfl0LL5Jnt0kr2L/Oi5R++JV0qH7E1vrnaU68RQeOpg3JdTHUFln9/meyjCiQnE0PziN
    tj/lBWrc2WcZf+z5NkgOd33vJ2LOfsCrjAFlxOa6UNY5HvRGQ4sqern16o1QOpJqMhDVkN
    /zUoPJrZi+MaW16YeTGQcgyzNez3hGh9B3blohBRgpkVsRSmQssdRQ4Rs0+2aiyrpdLbrh
    ZfR56gTPa5VxISRSO/4SFM2Q5qml+ToYHyDhEuMF2EwgxlHDXoj9UF5jCCI8uc2adTqA0O
    YLvG/ddqeSWaOznQbem/qnAFga4LmuqOPxbwgkYlAjTzBe+nYHTDxkkL3nTVk4eJbR08HK
    pL8GGfMtou3V25Fpt4hV+9kcRW3ajSd5vHbgIExnUDh7OobEAzoF+/gN7QFG+aDhP5KuRt
    1622xYzvjNf3gGMkSo5k5SIjiijNUxcHYOejO+V5G78ONtucJDVp4Y9AEZJiD67Cqz1Una
    lKbBG3DaaNAAbBRnthYoUF/wC5tSyfimJ+iP7lMonugHglbWNC2rRG3gTRkQ
X-ME-Proxy: <xmx:nlHFakAA8puUgbk3lmQPEvA6L-Y65TFXj7fJLZ4pUUYpQcHO1DXDpA>
    <xmx:nlHFarEuv2_q1ruheaoG8c521nBMj7wsE4hY-AuVK5clCGT9I1nOpQ>
    <xmx:nlHFaktnZiKjEFZFDcRRBw4Gm9IZO3eyqaTEy_BVl9ezG7wGfH5Hiw>
    <xmx:nlHFahnuRiwEgX2nAR8oHbh3c1qx8ck8uJ6cwGmvy8BJdhNpK83EZA>
    <xmx:n1HFakterNy7uBzT0vGrNWnnr9Lta_FiP_m0M9Ak-GVWcgmoaEVmzvUK>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Oct 2026 15:52:58 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 4/7] leds: aw2013: use dev_err_probe
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-4-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-4-108ecbdf2775@postmarketos.org>
Date: Tue, 06 Oct 2026 21:52:46 +0200
Message-Id: <179131636687.6822.4895381769539366104.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791316378; l=352;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=NJ1pRbRnKJmFoEUqhxcP8u3zEH4RTXw94iffrMDycjw=;
 b=ujdRNQDCJOxKnTvhoZptG9V/l3QiRKpKvMMuNZB6LfCCYZQATZ6sVJKLSdAUSnqxQ9nFQHDOE
 TSfE6UxbJQVDmftjN7xtidJXyuuC7buZfzHJA8Ic0U5bCqL0w6+0icf
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

On Mon, 05 Oct 2026 20:46:05 -0700, Paul Sajna <sajattack@postmarketos.org> wrote:
> Failure to use dev_err_probe() for regulator requests violates
> LED subsystem guidelines.
> 
> The original driver didn't use it, but it's worth cleaning up
> while I'm here.
> 
> 
> [...]

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>

-- 
 

