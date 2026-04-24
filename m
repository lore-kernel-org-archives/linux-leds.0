Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E60D34A783;
	Fri, 24 Apr 2026 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019307; cv=none; b=O2odEtWQJyPMgjQTUfh+gsuIy5rzJHI3u7RkTs+wAk+tvUDC8RMrGUhqG7hASI0Cs+qj9rPLXhNvL+LNHSFUI8J8QgvAk1t8C11COI45vkkzShh6+WxndISyjEmJsm5yugNBtDsA0kmCrWGsCnk/QqpSUnMFeJj0htgZ5epqRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019307; c=relaxed/simple;
	bh=UShO68+zn02MTvLeNNFJAU63a9LU6U//OEYhRy002Rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LMPO+VO9ItRU3MNuQfmeGcpeK0Dgbgq0dgzSZIx6cJvIYQ7HLBfu3UmJCHWV2DpKpGiVZDSlkUQtCVB+fmbrERgyD7JM3vdYFV2RlmdPD97YQOCz7TsJjo5pX2HrnEoVnmu73mRkIXiCLqNHN7Uw0K9Dz5UZEsHcrkxH7pzm98o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C68I4AN4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C68I4AN4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69F1C2BCB5;
	Fri, 24 Apr 2026 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777019306;
	bh=UShO68+zn02MTvLeNNFJAU63a9LU6U//OEYhRy002Rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C68I4AN4NysoZIkjFpiqfpMIePIV4QbTbKrC3Pj3oks+Vx+keJOqyMqdAVF71sZMD
	 WwsuTDiGLP948g+TpxjCkXSPD4EDX6sB6yXCjMys4jpHA2xtoWLKJzHbvvyHxtJkl0
	 kDUhQvT70bbSy9DULtVn18S2HT/y2NP4OQV1zT4oiNmUL53JSk0yBEE6ncsvyPJepa
	 MPqIq2QSLCK5VcuzTCkQesJPMBLf+/ziNz/DEw1roHEnwkaw6c3itgVXFu8EsMetNF
	 nDUj11ZoBuLNN1kMA5tqdAlddk86grn4iRcOFbZMpCoTvl7CFn09azHfUhM8qibvJI
	 HhOTekW5mFTUA==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
 devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Ashley Towns <mail@ashleytowns.id.au>, Dan Murphy <dmurphy@ti.com>, 
 Gergo Koteles <soyer@irl.hu>, INAGAKI Hiroshi <musashino.open@gmail.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Olliver Schinagl <oliver@schinagl.nl>, Pavel Machek <pavel@ucw.cz>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Roderick Colenbrander <roderick@gaikai.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260408062942.7128-1-corvin.koehne@gmail.com>
References: <20260408062942.7128-1-corvin.koehne@gmail.com>
Subject: Re: (subset) [PATCH v2] dt-binding: leds: publish common bindings
 under dual license
Message-Id: <177701930253.726046.1017441010265310205.b4-ty@b4>
Date: Fri, 24 Apr 2026 09:28:22 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 08 Apr 2026 08:29:42 +0200, Corvin Köhne wrote:
> Changes leds/common.h DT binding header file to be published under GPLv2
> or BSD-2-Clause license terms. This change allows this common LED
> bindings header file to be used in software components as bootloaders
> and OSes that are not published under GPLv2 terms.
> 
> All contributors to leds/common.h file in copy.
> 
> [...]

Applied, thanks!

[1/1] dt-binding: leds: publish common bindings under dual license
      commit: 485ecbb5bdc0f73b8b4a50a8ac4a0fe038c49916

--
Lee Jones [李琼斯]

