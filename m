Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F952F60CC
	for <linux-leds@vger.kernel.org>; Tue,  7 Apr 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568407; cv=none; b=FxLqe89kQkTAPvBkQkRmHQyo2PAq9qs9q94upKhZ0CjqVISQsUkkXs+Sx8+XxTDizNXAEzqc/MXm6wJfOBmwpThCUpIhdI15AQCNSZVehe0/m5Uo2mJSPXT5u1oxVpf5d2GSrEpHOgbv0OUNVPaLhxNUSu38HuSxyM1rctIYHXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568407; c=relaxed/simple;
	bh=c22d6V2u61GovLZpfs8FBVr+t/XEZPWaprwWGg07XzI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hwfc3Okc0WjB8huqwoVShi8ABlK9UyUnLtZDBx6XwwkmyT7Hga+ThkaO7nKT9eQ6R6aXvo7kD1wfNoFECTgvj1/jOBcLxFegjMXdKeCxxK0NKnewdDpLLoFrWtbqABHck6GZk72jv/AyNHQGODKmiDlCHhUMj1lUclYWzgi6KcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bes.tel; spf=pass smtp.mailfrom=bes.tel; dkim=pass (2048-bit key) header.d=bes.tel header.i=@bes.tel header.b=K9cFKZ3/; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=tXXUXlXz; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bes.tel
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bes.tel
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bes.tel header.i=@bes.tel header.b="K9cFKZ3/";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="tXXUXlXz"
DKIM-Signature: a=rsa-sha256; b=K9cFKZ3/O7h5iU+RCg2td0WSFfSi9rxIN4o4HFrtDyhfF34k1z4+wTzZN+mNq6oK67ShmP4ScPK8O2/sKoAoIJhzczf7MeoLmf2+bFz6m7qKomdQAo+RkLjvnhqAhcRlRO9MniFLK305dJmogL8AlgcYQK4U6cY4jBq2r9FPU1tzc3lU+AGlBeFCnNnUekHljiosI7Y8+GYOpTwOOh+tVkii1FkxruyQTKbR8pAViksMzcKgnfwVVXk9y8y7+22zban+9QDTUMCglOYeXZFMMhtGlB6QwBHaCa6s79bDy3v8GzvH+ulHBe3IkJWOK6eOBuzeW5qghzHi/1a/byCBaA==; s=purelymail2; d=bes.tel; v=1; bh=c22d6V2u61GovLZpfs8FBVr+t/XEZPWaprwWGg07XzI=; h=Received:Received:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=tXXUXlXzcqzitsSZr9rXJpasJgtrHDRAZQtJRJUS8xIXOFOtC7DbAudIZct6fHo2PQcY98YgfYi3nVSEzi7lhU/M+rYUo3Cxyu5AH3Lo78bZWXODTd2l3b/wz2t2OkOjcXC4tKYcJkakWhiES3iGBXqfc8Xm9RfUFzhlXUxeRlqa+ctzeN7eOpu9ZnrE/fxADuujIt5/gaqeTag83t8PoX0waXfrFbBaSOcA/hmPOOtZ5FK1LaERQBu9ZwRrrBK87As2aJN8iOPkhukyFiaKe/gNoL0H6PjVCHV/+CLmh7heOcHYgDt8FOPJZ8w+USD4qo0HsAeHcVdMGtHqgRR/lA==; s=purelymail2; d=purelymail.com; v=1; bh=c22d6V2u61GovLZpfs8FBVr+t/XEZPWaprwWGg07XzI=; h=Feedback-ID:Received:Received:Subject:From:To:Date;
Feedback-ID: 19882:3702:null:purelymail
X-Pm-Original-To: linux-leds@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1629212201;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 07 Apr 2026 13:26:06 +0000 (UTC)
Received: from [10.2.161.35] (unknown [10.2.161.35])
	by awak.mobi (Postfix) with ESMTPSA id 9F2F93600E2;
	Tue, 07 Apr 2026 15:26:04 +0200 (CEST)
Message-ID: <0ebbfbc5163806341165be55631c5834a6946aab.camel@bes.tel>
Subject: Re: [PATCH 0/1] Documentation: leds: leds-class: Document keyboard
 backlight LED class naming
From: Xavier Bestel <xav@bes.tel>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rishit Bansal <rishitbansal0@gmail.com>, Carlos Ferreira	
 <carlosmiguelferreira.2003@gmail.com>, Edip Hazuri <edip@medip.dev>,
 Mustafa =?UTF-8?Q?Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org
Date: Tue, 07 Apr 2026 15:26:02 +0200
In-Reply-To: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
References: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
Autocrypt: addr=xav@bes.tel; prefer-encrypt=mutual;
 keydata=mDMEaBuzUBYJKwYBBAHaRw8BAQdAGHVrbf6OLBOo4PjYPoYLSIOV+u8/rKgFlLM4pk+rj
 eC0G1hhdmllciBCZXN0ZWwgPHhhdkBiZXMudGVsPoiWBBMWCgA+FiEEPYfp8pYhYROehNkEULR9s/
 9K9OgFAmgbs1ACGwMFCQWjmoAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQULR9s/9K9OgeJAD
 /aPp0IPj5ahqo7DGo1Xk8/t7afPAHYMBeV03Fte4f57EBAPKvhRUTyR4+CrPtGERWfoYlxNkp5yKr
 wwkjUbLon1AG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 06 avril 2026 =C3=A0 19:46 +0200, Hans de Goede a =C3=A9crit=C2=A0=
:
> Drivers which need this are:
> [...]
> 3. Logitech G710/G710+ gaming keyboards HID driver:
> https://lore.kernel.org/linux-input/20260402075239.3829699-1-xav@bes.tel/
> Posted a week ago, needs an agreement on the LED class dev naming scheme
> to continue.

Indeed. I referenced Documentation/leds/leds-class.rst as if your patch
was already merged. Thank you for tackling this !

Regards,

	Xavier
