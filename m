Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514732;
	b=eGTobQuw/0AhraG33jeL0i/RY8CcsbxH3NgUyGI49tT5M8vqiPczjEdb1CvzWPf9Dac+
	 Rm+Gcr8apvamFWlRJR0PtGnNCINVvSnb/BfHdKGqttAvmuEP108qjCvW1qEkzBa+RR+mj
	 zh2JDGSHdjxmEcVzZzfwurdp8AD2xUxQXLp0NYjezAJLh1eGQsIjaxvVeiaFyfkniT+dS
	 HfGbk5Wbix7Ebt28D/FDRean8g7v5SB+hykHAFKxH3ve/Oso1QJ/uN3XyCEh6w+oQmvoH
	 B11VyS1cAP2RBt/GS+vil/bfh0TYs+HBREgWIMoMKaZD0PPSWqAfyDhfezBs8/+Xx9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514732;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/UeVOIpYwtmneRLoi/P6NHqOVwuT+iS7oh+UCgyJoDU=;
	b=LvQ0X7TezuWdtg2YohRtEcWCH8PbWV6VCb5albPC2p/YNbd5YxrmWiQ7Auux7KC7VzHj
	 NnIOVnSttHsD/ufk82lgCjosAOfuJXsMLCLfIu8V6fSXFpOTfg3iOblZLt5iTZRuCxDYm
	 lWgALh7pWMiyqMbCksTajJMBE9dGtmzymzOUkwDhMLm47ZC8fnpTcIwH2b6k8/G5d81eo
	 HUZVq0owg4/3bM3mNheRaTGbIXo+GlbxaWCo2dZRbqpPDTsrxWZ3xw3XzDeH/+wB3NLx4
	 il8o/o8NH2HSsPhjQ7Quf579Tj65vaPC7mcQz0FNY2MCvoc60H9T/QNtpyXM3HTNsew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yyf9K8ZO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B47B606A31E
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yyf9K8ZO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C71B1F000CA;
	Tue, 24 Nov 2026 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514731;
	bh=/UeVOIpYwtmneRLoi/P6NHqOVwuT+iS7oh+UCgyJoDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yyf9K8ZOqTRT09uoOv5ogSN7nUf12mujTm9pXEqyqY97zDRqiO4iqtG2FAJRY8ivI
	 0c9IP6Q9gqhaC+ykYgQXOeMTyI5t+rPqiYS6cSP/lm2isOZU3KfxOpqajAKF36BASf
	 9U99Bct10ROjxUHGqmjKoWCrpoQVsyFFHQFzgzPfrc/qsAMd0CZimHUNR9pxnccpMx
	 kbHFGB+X6lCA5WHNEH1f1wGyu55+laEdWBlzTSGgYN9auTT+qnDWy0B8WnHBUXHH/o
	 LDZ7+t+9zOAjYJlR93fVRCl209I6waCjXKwLrtPJywfcd6HoXuzLWYpx9elOVoPnyN
	 FBKUFyUpcwPCg==
Message-ID: <sashiko-outbox-230912@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] leds: flash: qcom-flash: fix the v4l2 flash release
 loops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261124095408.3842986-1-congnt264@gmail.com>
References: <20261124095408.3842986-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:05:31 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 2-patch series:

- Patch 2: no issues found.
- Patch 1 ("leds: flash: qcom-flash: fix the v4l2 flash release..."): 1
  related pre-existing bug noted

A detailed review has been sent as a separate reply to patch 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124095408.3842=
986-1-congnt264@gmail.com
