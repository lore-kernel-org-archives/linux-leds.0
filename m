Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F14C77BC;
	Tue, 13 Oct 2026 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885516; cv=none; b=G4+zpolS34+Kby+D0HGLgdJKZHGWSS7WQaNueIpYCQS0L477em+Gfpj8lsMHeoF8O374DXO85Ie7vY7PVT/Td5gshfFnbYlNRK25IMifcD5UKaAgCjKMbpvNwJrLg5R/QLCUtyiymWFu6mL1gh7rpIgXC/LDBEfLclZf95R6vCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885516; c=relaxed/simple;
	bh=CSO6NTt2mVPFWWK2F/I1n0QJQ3s8fuZYA2OSPW8iU3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lW+PYXprV6Vt3q/s9M7EmccNV0TxGQt2fGLiEIxioj1x3uaTUIj2C8cdWV07u5O32NGgFtgAlsnvjU+Jmoy+jEcVt9GNTNlFbAYMfDZ0vC4+yrR0BLifYemlhzXQ1symYLAC7tKJNNdNvozhZVBUPUKr67/6hW7jZHaoxAel+y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net; spf=pass smtp.mailfrom=amieiro.net; dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b=sWS5bZ++; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b="sWS5bZ++"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4j3qXd0zvFzMlbZ;
	Tue, 13 Oct 2026 11:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1791885505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSO6NTt2mVPFWWK2F/I1n0QJQ3s8fuZYA2OSPW8iU3A=;
	b=sWS5bZ+++W4NPaSorp8b6DJwV9wS+TG1YGv584H1wk1Ya/AS64svqdxXQ0EDnuLSDgDRbl
	8Zprpq+eOc3g1WrnVIWYbN96BinUF1FUHZDfiDV4ain/k95XIb7txVrkTYD/WZm/TkDlZ/
	UFx+lrGRCQnZRSIIeJerF7d689g+B9nQXs3kkG0T+fzClDwYUX3JuXOdnhaCMCePbJ5Bot
	hfUAU3NuhKfGcP1fWDeKls3Yal9VJy67NDamCmczX4C69lnJmxQQvzyrwBpdM4TlUveVO7
	qfAzeHqZzVvUYYeFe7m2TzuROgxUqk8ZuT6GtX18+xH8MatTFNMJltt4JZOlcA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: =?utf-8?Q?Fl=C3=A1vio?= Amieiro <flavio@amieiro.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
In-Reply-To: <20261013-jolly-salamander-of-tact-7cf46e@quoll>
References: <20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net>
 <20261013-add-is31fl3206-support-v1-2-08c066cc241d@amieiro.net>
 <20261013-jolly-salamander-of-tact-7cf46e@quoll>
Date: Tue, 13 Oct 2026 06:58:05 -0300
Message-ID: <87zewhudle.fsf@berlin>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4j3qXd0zvFzMlbZ

Krzysztof Kozlowski <krzk@kernel.org> writes:
> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.

I'm sorry, I read this e-mail after sending v2 of the patch series. I
will organize the commits and send v3.

Thank you for your review!

Best regards,
Fl=C3=A1vio Amieiro
