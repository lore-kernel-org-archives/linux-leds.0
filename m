Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696280;
	b=sELRVfVXV9Zo6B2ASxHUrj8MKjLzGNdsGGS8ficfxfgTk6rqzXFkDkD39oStsJfZShtY
	 CdimVXaNr+q2oLJEAeQSEOBfdwf72a9rurHDnXvJ4QAUdZnZuLVWrBua7O6dQ7hKgbwKU
	 DGIN6HtgF6R0ljEAjDpA8ZZWwD7LX3STcE1wjkj+IiBcglCTnagJIaxF/oGRKF3mVyYXq
	 7X5MVwhLekTO4DeJU7igriu9Q6YhTtCSAeXeQ5jl/hEWuqWp/lRGEv4VXHliXf0aKor1w
	 8/O7yxpXVS09Bt3qbvw6AqE1/wVhk95/JOpmWSOWS9AU8vkaORO+daR1DS9MNhIkTsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696280;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=yJb+KOZ/zmj8Fns3CIInNWprV2HZ5qGNxwyn1s60ypk=;
	b=kXHypryhBApI7Z9Yxe0ZVKE5vWiJiTNoKswSyXG4Bv6idoG4Yr6RjAaYJyipJTQ/zT4Q
	 JAqvorOw2FOdUwcQ8+qiIk2nHuq/YiypmJ8atavd7FhifcG6ZzvuDELbJy0CKIPVuVBpL
	 M3Czk+DwKwEuy9aWr9UgXsWcnZ7CwONsRE5/rpSST5PrnUCK3oVS+p6d9mTtWBDa/+7rT
	 Od2w46vX90jv7HDd61QTQNYKYYmAkZgQATctKNwoG+Xs54jMW0R0jIZA4PuUgwGWyWum4
	 XgyEtK0Ji18/D+U6a01Ux5xZ3yfBzPbdFoBriDvtOfyVcoCjCKi+ktkpDnfGYKJNh0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iD84DYiZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6762C606A31E;
	Thu, 26 Nov 2026 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iD84DYiZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1841F000D1;
	Thu, 26 Nov 2026 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696279;
	bh=yJb+KOZ/zmj8Fns3CIInNWprV2HZ5qGNxwyn1s60ypk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iD84DYiZPJ0ePeZorujH99dMO8XU5aGcfZj+7CQ/CgjHi1eEJw6XPSU+Xwa532voB
	 ryhhmAajnU0grcT43/DCyzVCCPo0kpGlFtJm6RngdUK7rhecTWGx6nuz1XKY618uSN
	 KxTeVY6OgyZL2zQDQnkAo0ZoEvvqu/OHIijrjaOpIaYB+lN4p4UL+lrSMaC2WUIJVh
	 BKj1nG5qsSSwIybyL9lkb3Ra1NTo2ANyCCvV55kNI8VEDrao98CxL8c+47IvaSIVQd
	 c45pQ1H14G2ZnCJzwtywVgYwqfcIs4gLmNIWjyXE+4HQqcaRd7aVE1xNpVDVK/ZjRx
	 4F3kQQNvLP/og==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-leds@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261115090520.102216-4-clamor95@gmail.com>
References: <20261115090520.102216-4-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v6 3/3] mfd: max8907: Add LED cell
Message-Id: <179569627733.65215.7739958510211892846.b4-ty@b4>
Date: Thu, 26 Nov 2026 12:31:17 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sun, 15 Nov 2026 11:05:20 +0200, Svyatoslav Ryhel wrote:
> Add the LED cell name to the list of MAX8907 cells.

Applied, thanks!

[3/3] mfd: max8907: Add LED cell
      commit: dc71f64fc283661d77d6a9a4bf38af94b4daeb5a

--
Lee Jones [李琼斯]

