Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0857D3A7F66;
	Fri, 28 Aug 2026 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909456; cv=none; b=uhm2r/fFyJ3MdbldOHsQEqXx59BN9iTxyPnlDarYkrCIZY/8t8kmUiE+lhOyx6BdO3SmNJCkJYAgvBylT28WFxom/O6mKSeGHMGuNzZ+nC/fIZMqO5rDBUusuQTeGKWJipIDiCYVWU6wmkvEA1c5NQczX275wlgJatQy0wDoNr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909456; c=relaxed/simple;
	bh=5yBimtOgQBv03M54VA8T/0Qa/rmfH0IO7nIgLovFWjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE91IBR+BBAA8CAoayo9GLiKaVK0JYS9YsMHII3QH3TvrTctqqzrbFXKY5X1xlwdEpK9wmHxSt38gMj37RMRilDxxYqdWTKuIltJTqq+nLKkcUG7etwczteu9CtLDbg8/8wWz4YtooxxtYk6e7/muHLfNAoE8OTIZ/TleyUDwsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PC80W07E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PC80W07E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3E641F000E9;
	Fri, 28 Aug 2026 09:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787909454;
	bh=PgGm5dtzCVgs3RRy4g0v4mT8SJfNGScJPR3E0Qvx4lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PC80W07EIkDGIYUD/LfrzAcySm8TQznSuUKijj5SrdqRukQ7kn4QveWOzsvhqsFw+
	 FGvzTqIm4bH/C/oaSfj33whg019D61hFsGdHuznLDcso2uHLCvUrGw4Dls/y6W9YjV
	 rgYgIwBha/9yB/OoXSUVn0rBF/d804wPApuOfQsITHkL2PYScAN7AHv0qVd6BcD0Pj
	 xV4r/nvOkNfeN0XTxq6tc/AchMDYuiELPiaVWqmTJGAYboKt94z5IJ4dG//rtZRrWX
	 N2TDWx5i4XWHamgQNoFwz2u78QF+wo7ANa7NC512jj0BMfJIc/jUcqS4E+0qUpl9KS
	 wfY43aj9H8fGQ==
Date: Fri, 28 Aug 2026 11:30:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmad Byagowi <ahmadexp@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nam Tran <trannamatk@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: leds: Add IS32FL3207 controller
Message-ID: <20260828-lyrical-cassowary-of-advertising-394bc8@quoll>
References: <cover.1787502624.git.ahmadexp@gmail.com>
 <28f5f4a212c8110ce4fbaa97c3c5b7e98ca30157.1787502624.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <28f5f4a212c8110ce4fbaa97c3c5b7e98ca30157.1787502624.git.ahmadexp@gmail.com>

On Sun, Aug 23, 2026 at 09:35:08AM -0700, Ahmad Byagowi wrote:
> The IS32FL3207 is an 18-channel constant-current LED controller with
> per-output PWM and current scaling.
> 
> Describe I2C addressing, power and shutdown controls, RISET, and
> individual or multicolor output groupings. Require board current limits
> for each output and document their relationship to the RISET-derived full
> scale.
> 
> Allow dash-suffixed multicolor group names when a group begins at channel
> 16 or 17, which cannot be represented by the common schema unit-address
> form.
> 
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>  .../bindings/leds/issi,is32fl3207.yaml        | 285 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 291 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

